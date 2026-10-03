import pathlib, re

for f in ("connect.svg", "README.md"):
    s = pathlib.Path(f).read_text("utf-8")
    urls = sorted(set(re.findall(r'https?://[^"\' >)]+', s)))
    print(f)
    for u in urls:
        print("   ", u)