"""Layout sanity check: fraction of non-background pixels per 20px band.

Single-row sampling hides text (glyphs sit above their baseline), so this walks
the whole band. Usage: python tools/ink.py inline | t9000
"""
import pathlib, sys
from PIL import Image

BG = (18, 20, 35)
P = pathlib.Path("tools/preview")
which = sys.argv[1] if len(sys.argv) > 1 else "inline"
cards = ["hero", "about-life", "stack", "id-dashboard", "connect"]

for c in cards:
    f = P / (f"inline-{c}.png" if which == "inline" else f"{c}-{which}.png")
    im = Image.open(f).convert("RGB")
    w, h = im.size
    out = []
    for y in range(0, h - 20, 20):
        ink = tot = 0
        for yy in range(y, y + 20, 3):
            for x in range(2, w - 2, 4):
                p = im.getpixel((x, yy))
                tot += 1
                if abs(p[0] - BG[0]) + abs(p[1] - BG[1]) + abs(p[2] - BG[2]) > 24:
                    ink += 1
        pct = ink * 100 // tot
        out.append(f"{y:4d}:{pct:3d}")
    print(f"{c:14} " + " ".join(out))