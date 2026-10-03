"""Confirm the hero video frames actually paint (compare clip area vs card background)."""
import pathlib, statistics
from PIL import Image

im = Image.open(pathlib.Path("tools/preview/inline-hero.png")).convert("RGB")


def stats(box, label):
    px = [im.getpixel((x, y)) for y in range(box[1], box[3], 3) for x in range(box[0], box[2], 3)]
    lum = [0.299 * r + 0.587 * g + 0.114 * b for r, g, b in px]
    print(f"{label:22} n={len(px):6} mean_lum={statistics.mean(lum):6.1f} "
          f"sd={statistics.pstdev(lum):5.1f} min={min(lum):5.1f} max={max(lum):5.1f}")


stats((600, 78, 1260, 449), "video clip 660x371")
stats((600, 455, 1260, 520), "control below clip")
stats((40, 460, 560, 520), "control left bottom")
stats((40, 60, 560, 130), "name/headline area")