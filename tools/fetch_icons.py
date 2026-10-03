"""Grab the few brand paths that were not in the cached simple-icons dump."""
import json, pathlib, re, urllib.request

ROOT = pathlib.Path(r"C:\Users\Pc\Desktop\Ox19\Git\oxploited19")
icons = json.loads((ROOT / "tools" / "icons.json").read_text("utf-8"))

for slug in ("linkedin", "tryhackme"):
    if slug in icons:
        continue
    # linkedin was pulled from the Simple Icons CDN, so jsDelivr's copy wins
    for url in (f"https://cdn.jsdelivr.net/npm/simple-icons@latest/icons/{slug}.svg",
                f"https://cdn.simpleicons.org/{slug}/eceef6"):
        try:
            req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
            svg = urllib.request.urlopen(req, timeout=30).read().decode("utf-8")
        except Exception as e:
            print("miss", slug, url, type(e).__name__, getattr(e, "code", ""))
            continue
        d = re.search(r'<path d="([^"]+)"', svg)
        if d:
            icons[slug] = d.group(1)
            print("added", slug, len(d.group(1)), "from", url)
            break

(ROOT / "tools" / "icons.json").write_text(json.dumps(icons, indent=0), encoding="utf-8")
print("icons.json:", len(icons), "paths")