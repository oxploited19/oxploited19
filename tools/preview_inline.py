"""Inline-render harness: embeds each SVG directly in the document so the page
timeline drives both CSS and SMIL animation. Used to verify content/geometry."""
import pathlib, re, subprocess, sys
from PIL import Image

ROOT = pathlib.Path(__file__).resolve().parent.parent
OUT = ROOT / "tools" / "preview"
EDGE = r"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
CARDS = ["hero", "about-life", "stack", "id-dashboard", "connect"]
BG = (18, 20, 35)

parts = ["<!doctype html><html><head><meta charset='utf-8'><style>",
         "body{margin:0;background:#0d0e16}svg{display:block}</style></head><body>"]
for c in CARDS:
    svg = (ROOT / f"{c}.svg").read_text("utf-8")
    svg = svg.replace('<?xml version="1.0" encoding="utf-8"?>', "")
    parts.append(svg)
parts.append("</body></html>")
page = OUT / "inline.html"
page.write_text("\n".join(parts), encoding="utf-8")

ms = int(sys.argv[1]) if len(sys.argv) > 1 else 9000
png = OUT / f"inline-t{ms}.png"
subprocess.run([EDGE, "--headless=new", "--disable-gpu", "--hide-scrollbars",
                f"--virtual-time-budget={ms}", "--window-size=1280,2620",
                f"--screenshot={png}", page.resolve().as_uri()],
               capture_output=True, text=True, timeout=300)
im = Image.open(png).convert("RGB")
print(png.name, im.size, "colors", len(im.getcolors(maxcolors=900000) or []))
y = 0
for c in CARDS:
    vb = re.search(r'viewBox="0 0 (\d+) (\d+)"', (ROOT / f"{c}.svg").read_text("utf-8"))
    h = int(vb.group(2))
    crop = im.crop((0, y, 1280, y + h))
    crop.save(OUT / f"inline-{c}.png")
    bands = []
    for by in range(0, h - 40, 40):
        px = [crop.getpixel((x, by + 20)) for x in range(4, 1276, 6)]
        ink = sum(1 for p in px if abs(p[0] - BG[0]) + abs(p[1] - BG[1]) + abs(p[2] - BG[2]) > 24)
        bands.append(f"{ink * 100 // len(px):3d}")
    print(f"{c:14} h={h:4d} ink% {' '.join(bands)}")
    y += h