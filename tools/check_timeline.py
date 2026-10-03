"""Deterministic timeline probe.

Headless screenshots with --virtual-time-budget do not reliably advance CSS
animations inside an <img>-loaded SVG, so cross-fades can look frozen when they
are not. This harness inlines the SVG, then pauses every animation and seeks it
to an explicit time via the Web Animations API (CSS) and setCurrentTime (SMIL).
Any two timestamps therefore show exactly what a viewer sees at those moments.

Usage: python tools/check_timeline.py [card] [t_ms ...]
"""
import pathlib, subprocess, sys
from PIL import Image, ImageChops

ROOT = pathlib.Path(__file__).resolve().parent.parent
OUT = ROOT / "tools" / "preview"
EDGE = r"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

CARD = sys.argv[1] if len(sys.argv) > 1 else "about-life"
STAMPS = [int(a) for a in sys.argv[2:]] or [500, 3000, 6000, 9000, 12000]

svg = (ROOT / f"{CARD}.svg").read_text("utf-8").replace('<?xml version="1.0" encoding="utf-8"?>', "")

TPL = """<!doctype html><html><head><meta charset='utf-8'>
<style>html,body{{margin:0;background:#0d0e16}}svg{{display:block}}</style></head>
<body>{svg}
<script>
const T = new URLSearchParams(location.search).get('t');
function seek() {{
  const s = +(T || 0);
  document.getAnimations().forEach(a => {{ try {{ a.pause(); a.currentTime = s; }} catch (e) {{}} }});
  document.querySelectorAll('svg').forEach(svg => {{
    try {{ svg.pauseAnimations(); svg.setCurrentTime(s / 1000); }} catch (e) {{}}
  }});
}}
if (document.readyState === 'complete') seek(); else addEventListener('load', seek);
</script></body></html>"""
page = OUT / f"timeline-{CARD}.html"
page.write_text(TPL.format(svg=svg), encoding="utf-8")


def shot(ms):
    png = OUT / f"tl-{CARD}-t{ms}.png"
    subprocess.run([EDGE, "--headless=new", "--disable-gpu", "--hide-scrollbars",
                    "--virtual-time-budget=1500", "--window-size=1300,700",
                    f"--screenshot={png}", f"{page.resolve().as_uri()}?t={ms}"],
                   capture_output=True, text=True, timeout=300)
    im = Image.open(png).convert("RGB")
    return im.crop((0, 0, 1280, im.height))


def diff(a, b, box):
    st = ImageChops.difference(a.crop(box), b.crop(box)).convert("L")
    return 100.0 * sum(st.histogram()[24:]) / (st.width * st.height)


frames = [(ms, shot(ms)) for ms in STAMPS]
regions = {"full card": (0, 0, 1280, 640), "captions y494-548": (688, 494, 1252, 548),
           "rings y584-616": (688, 584, 1252, 616)}

print(f"{CARD}: {' '.join(f'{m}ms' for m, _ in frames)}")
for name, box in regions.items():
    cells = [f"{diff(a[1], b[1], box):5.1f}%" for a, b in zip(frames, frames[1:])]
    print(f"  {name:20} " + " ".join(cells))
print("  (percent of pixels differing between consecutive timestamps)")