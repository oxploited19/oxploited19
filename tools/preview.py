"""Render the five cards through an <img> wrapper - the same path GitHub uses.

Usage: python tools/preview.py [timestamp_ms ...]
Writes tools/preview/all-t<ms>.png plus a per-card crop of each.
"""
import pathlib, re, subprocess, sys
from PIL import Image

ROOT = pathlib.Path(__file__).resolve().parent.parent
OUT = ROOT / "tools" / "preview"
OUT.mkdir(parents=True, exist_ok=True)
EDGE = r"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
CARDS = ["hero", "about-life", "stack", "id-dashboard", "connect"]

html = ["<!doctype html><html><head><meta charset='utf-8'><style>",
        "body{margin:0;background:#0d0e16}img{display:block;margin:0 auto 6px}",
        "</style></head><body>"]
html += [f"<img src='../../{c}.svg?v=1' width='1280'>" for c in CARDS]
html.append("</body></html>")
page = OUT / "preview.html"
page.write_text("\n".join(html), encoding="utf-8")

stamps = [int(a) for a in sys.argv[1:]] or [3000, 9000, 15000]
# each <img> renders at its viewBox height (width is pinned to 1280) plus a 6px gap
heights = []
for c in CARDS:
    vb = re.search(r'viewBox="0 0 (\d+) (\d+)"', (ROOT / f"{c}.svg").read_text("utf-8"))
    heights.append(int(vb.group(2)))

for ms in stamps:
    png = OUT / f"all-t{ms}.png"
    cmd = [EDGE, "--headless=new", "--disable-gpu", "--hide-scrollbars",
           f"--virtual-time-budget={ms}", "--window-size=1300,2620",
           f"--screenshot={png}", page.resolve().as_uri()]
    subprocess.run(cmd, capture_output=True, text=True, timeout=300)
    im = Image.open(png).convert("RGB")
    y = 0
    print(f"{png.name} {im.size} colors={len(im.getcolors(maxcolors=900000) or [])}")
    for c, ch in zip(CARDS, heights):
        crop = im.crop((10, y, 1290, y + ch))
        crop.save(OUT / f"{c}-t{ms}.png")
        blank = len(crop.getcolors(maxcolors=900000) or []) <= 3
        print(f"   {c:14} {crop.size} {'BLANK!' if blank else 'ok'}")
        y += ch + 6
