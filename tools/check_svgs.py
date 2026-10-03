"""Structural check for the generated SVGs: XML validity, ids, refs, tokens, size."""
import collections, pathlib, re, sys
import xml.etree.ElementTree as ET

ROOT = pathlib.Path(__file__).resolve().parent.parent
fail = 0
# a frozen animation whose final value is 0 leaves the element invisible
# (stroke-dashoffset is excluded: 0 means "fully drawn", not "collapsed")
FADING = ("width", "height", "r", "rx", "ry", "font-size")
for f in sorted(ROOT.glob("*.svg")):
    s = f.read_text("utf-8")
    try:
        ET.fromstring(s)
        xml = "xml=OK"
    except ET.ParseError as e:
        xml = f"XML FAIL {e}"
        fail += 1
    ids = re.findall(r'\sid="([^"]+)"', s)
    dup = [k for k, v in collections.Counter(ids).items() if v > 1]
    refs = set(re.findall(r'(?:url\(#|href="#)([^)"]+)', s))
    missing = sorted(refs - set(ids))
    tokens = sorted(set(re.findall(r"__[A-Z_]+__", s)))
    # a frozen animation whose final value is 0 leaves the element invisible
    collapse = []
    for m in re.finditer(r'<animate\s+attributeName="([^"]+)"[^>]*?/>', s):
        tag = m.group(0)
        if 'fill="freeze"' not in tag or 'repeatCount="indefinite"' in tag:
            continue
        attr, vals = m.group(1), re.search(r'values="([^"]+)"', tag)
        if attr in FADING and vals and vals.group(1).split(";")[-1].strip() in ("0", "0%"):
            collapse.append(f"{attr}={vals.group(1)}")
    size = len(s.encode()) / 1024
    warn = ""
    if dup or missing or tokens or size > 1200 or collapse:
        warn = "  <-- CHECK"
    if dup or missing or tokens or collapse:
        fail += 1
    print(f"{f.name:20} {size:8.1f} KB  {xml}  ids={len(ids):3} dup={dup} "
          f"missing_refs={missing} tokens={tokens} collapses={collapse}{warn}")
print("FAIL" if fail else "all clean")
sys.exit(1 if fail else 0)