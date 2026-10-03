"""Extract the hero clip frames and optimise the ID-badge / character art.

Run once (needs ffmpeg). Frames are cached in tools/frames/ so later rebuilds
of the SVGs do not need ffmpeg again.
"""
import base64, json, pathlib, shutil, subprocess, sys

import imageio_ffmpeg
from PIL import Image

ROOT = pathlib.Path(__file__).resolve().parent.parent      # repo root
TOOLS = ROOT / "tools"
FRAMES = TOOLS / "frames"
HOME = pathlib.Path(r"C:\Users\Pc\Desktop\Ox19")
ASSETS = HOME / "Git"
OUT = TOOLS / "assets"

VIDEO = HOME / "ot dev 1.mp4"
BADGE = ASSETS / "ox19-badge.jpg"
CHARACTER = ASSETS / "Omar-RedTeam.png"

FPS = 24                 # playback rate of the SVG loop
START = 2.10             # seconds - highest-motion window found by motion analysis
CLIP = 2.0               # seconds of clip
W, H = 880, 495          # encoded frame size (16:9, 1.33x the 660x371 slot)
Q = 8                    # jpeg quality - trades a little sharpness for a much lighter hero.svg
LOOP = 4.0               # total SVG loop length

BADGE_SIZE = (272, 336)  # 2x of the 136x168 slot in the ID badge
CHAR_SIZE = (520, 668)   # 1.5x of the 368x424 slot in the footer


def extract_frames():
    if FRAMES.exists() and len(list(FRAMES.glob("*.jpg"))) >= 40:
        print(f"frames cached: {len(list(FRAMES.glob('*.jpg')))}")
        return
    FRAMES.mkdir(parents=True, exist_ok=True)
    ff = imageio_ffmpeg.get_ffmpeg_exe()
    cmd = [ff, "-hide_banner", "-loglevel", "error", "-ss", str(START), "-t", str(CLIP),
           "-i", str(VIDEO), "-vf", f"fps={FPS},scale={W}:{H}:flags=lanczos",
           "-q:v", str(Q), "-y", str(FRAMES / "f%03d.jpg")]
    print(" ".join(cmd))
    subprocess.run(cmd, check=True)
    print("frames extracted:", len(list(FRAMES.glob('*.jpg'))))


def frames_b64():
    files = sorted(FRAMES.glob("*.jpg"))
    step = 1.0 / (FPS * LOOP)                 # one frame per 1/96 of the loop
    hold = 0.0604                           # longer hold on the very first frame
    parts = []
    for i, f in enumerate(files):
        b64 = base64.b64encode(f.read_bytes()).decode()
        if i == 0:
            kt, vals = f"0;{hold}", "1;0"
        elif i == len(files) - 1:
            kt, vals = f"0;{i * step:.4f}", "0;1"
        else:
            kt, vals = f"0;{i * step:.4f};{(i + 1) * step:.4f}", "0;1;0"
        anim = (f'<animate attributeName="opacity" calcMode="discrete" values="{vals}" '
                f'keyTimes="{kt}" dur="{LOOP}s" repeatCount="indefinite"/>')
        parts.append(f'<image x="600" y="78" width="660" height="371" '
                     f'href="data:image/jpeg;base64,{b64}" opacity="{1 if i == 0 else 0}" '
                     f'preserveAspectRatio="xMidYMid slice">{anim}</image>')
    total = sum(f.stat().st_size for f in files)
    print(f"{len(files)} frames, {total/1024:.0f} KB raw -> ~{total*1.34/1024:.0f} KB base64")
    return "".join(parts)


def badge_b64():
    OUT.mkdir(parents=True, exist_ok=True)
    im = Image.open(BADGE).convert("RGB")
    tw, th = BADGE_SIZE
    scale = max(tw / im.width, th / im.height)            # cover-crop
    im = im.resize((round(im.width * scale), round(im.height * scale)), Image.LANCZOS)
    im = im.crop(((im.width - tw) // 2, 0, (im.width - tw) // 2 + tw, th))
    p = OUT / "badge.jpg"
    im.save(p, "JPEG", quality=88, optimize=True, progressive=True)
    print("badge", im.size, p.stat().st_size // 1024, "KB")
    return base64.b64encode(p.read_bytes()).decode()


def character_b64():
    OUT.mkdir(parents=True, exist_ok=True)
    im = Image.open(CHARACTER).convert("RGBA")
    tw, th = CHAR_SIZE
    scale = min(tw / im.width, th / im.height)
    im = im.resize((round(im.width * scale), round(im.height * scale)), Image.LANCZOS)
    bbox = im.getbbox()
    if bbox:                                               # trim transparent edges
        im = im.crop(bbox)
    q = im.quantize(colors=200, method=Image.FASTOCTREE)
    p = OUT / "character.png"
    q.save(p, "PNG", optimize=True)
    print("character", im.size, p.stat().st_size // 1024, "KB")
    return base64.b64encode(p.read_bytes()).decode()


def main():
    extract_frames()
    assets = {
        "__FRAMES__": frames_b64(),
        "__BADGE__": badge_b64(),
        "__CHARACTER__": character_b64(),
    }
    (TOOLS / "assets.json").write_text(json.dumps(assets))
    print("wrote tools/assets.json", (TOOLS / "assets.json").stat().st_size // 1024, "KB")


if __name__ == "__main__":
    main()
