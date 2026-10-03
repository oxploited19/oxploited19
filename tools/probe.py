"""Probe known feature coordinates in the rendered cards to prove each element drew."""
import pathlib
from PIL import Image

P = pathlib.Path("tools/preview")
PROBES = {
    "stack": [("header label", 60, 54), ("title text", 120, 92), ("chip1 icon", 574, 168),
              ("chip1 label", 600, 172), ("chip3 label", 790, 332), ("divider", 520, 300),
              ("orb0 item", 434, 290), ("orb core", 262, 290), ("ring path", 434, 185),
              ("chip label g2", 600, 212)],
    "id-dashboard": [("badge portrait", 190, 220), ("portrait scan", 190, 300),
                     ("name text", 150, 374), ("verified pill", 190, 419),
                     ("meta tile", 400, 150), ("kpi value", 400, 240),
                     ("bar tall", 1080, 400), ("bar mid", 860, 400), ("axis", 700, 420),
                     ("footer", 400, 455)],
    "connect": [("character", 200, 300), ("character arm", 330, 380),
                ("header", 460, 72), ("card1 disc", 482, 190), ("card1 text", 560, 184),
                ("card2 disc", 892, 190), ("card3 text", 560, 300), ("pill", 465, 398),
                ("chevron", 774, 190)],
    "hero": [("name", 90, 150), ("role line", 90, 200), ("video", 900, 250),
             ("badge strip", 400, 480)],
    "about-life": [("left card", 300, 300), ("right card", 900, 300),
                   ("segment bar", 700, 133), ("ring", 706, 598)],
}

for card, pts in PROBES.items():
    im = Image.open(P / f"inline-{card}.png").convert("RGB")
    print(f"--- {card} ---")
    for label, x, y in pts:
        if x >= im.width or y >= im.height:
            print(f"  {label:16} OUT OF RANGE")
            continue
        px = im.getpixel((x, y))
        bg = abs(px[0] - 18) + abs(px[1] - 20) + abs(px[2] - 35)
        print(f"  {label:16} ({x:4d},{y:4d}) rgb{px} {'ink' if bg > 24 else 'EMPTY'}")