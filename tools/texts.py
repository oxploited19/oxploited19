import pathlib, re

for name in ("hero", "about-life", "stack", "id-dashboard", "connect"):
    s = pathlib.Path(f"tools/src/{name}.svg.tpl").read_text("utf-8")
    s = re.sub(r'base64,[^)]{40,}', 'base64,...', s)
    print(f"===== {name} =====")
    for m in re.finditer(r'<text([^>]*)>([^<]*)</text>', s):
        attrs, txt = m.group(1), m.group(2)
        cls = re.search(r'class="([^"]*)"', attrs)
        x = re.search(r'x="([\d.]+)"', attrs)
        y = re.search(r'y="([\d.]+)"', attrs)
        sz = re.search(r'font-size="([\d.]+)"', attrs)
        anc = "anchor" if 'text-anchor="middle"' in attrs else ("end" if 'text-anchor="end"' in attrs else "")
        print(f"  x={x.group(1) if x else '?':>7} y={y.group(1) if y else '?':>6} "
              f"{sz.group(1) if sz else '-':>5} {cls.group(1) if cls else '-':10} {anc:6} {txt}")