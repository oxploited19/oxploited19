"""Build every self-contained SVG in the repo root from tools/src/*.tpl.

Fonts, brand icons, video frames and photos are inlined as base64, so the SVGs
render identically on GitHub with no network access and no JavaScript.
"""
import base64, html, json, math, pathlib, re, sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
TOOLS = ROOT / "tools"
SRC = TOOLS / "src"

FONT_KEYS = {"__FONT_SG__": "SG", "__FONT_SGM__": "SGM",
             "__FONT_JBM__": "JBM", "__FONT_JBMB__": "JBMB"}

# ---------------------------------------------------------------- brand marks
# Tools with no Simple Icons mark get a hand drawn 24x24 glyph instead.
CUSTOM_GLYPHS = {
    "suricata": ('<g fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round">'
                 '<path d="M2 16c3 0 3-9 6-9s3 9 6 9 3-9 6-9"/></g>'),
    "nuclei": ('<circle cx="12" cy="12" r="2.4" fill="currentColor"/>'
               '<g fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round">'
               '<path d="M12 2.5v5M12 16.5v5M3.4 7.2l4.3 2.5M16.3 14.3l4.3 2.5'
               'M3.4 16.8l4.3-2.5M16.3 9.7l4.3-2.5"/></g>'),
    "nessus": ('<g fill="none" stroke="currentColor" stroke-width="1.8">'
               '<circle cx="12" cy="12" r="9"/><circle cx="12" cy="12" r="4.6"/></g>'
               '<circle cx="12" cy="12" r="1.7" fill="currentColor"/>'),
    "openvas": ('<g fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round">'
                '<circle cx="12" cy="12" r="8.5"/><path d="M12 3.5v3M20.5 12h-3M12 20.5v-3M3.5 12h3"/></g>'
                '<circle cx="12" cy="12" r="2.5" fill="currentColor"/>'),
    "nexpose": ('<g fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round">'
                '<circle cx="10.5" cy="10.5" r="6.5"/><path d="m15.5 15.5 5 5"/></g>'),
    "bash": ('<g fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" '
             'stroke-linejoin="round"><rect x="2.4" y="4" width="19.2" height="16" rx="3"/>'
             '<path d="M12 7.4v9.2"/><path d="M9.4 9.6h3.4a1.7 1.7 0 0 1 0 3.4H9.4a1.7 1.7 0 0 0 0 3.4h3.8"/>'
             '</g>'),
    "moloCH": ('<g fill="none" stroke="currentColor" stroke-width="1.8" stroke-linejoin="round">'
                '<path d="M2.2 12S6 5.6 12 5.6 21.8 12 21.8 12 18 18.4 12 18.4 2.2 12 2.2 12z"/></g>'
                '<circle cx="12" cy="12" r="3" fill="currentColor"/>'),
    "wazuh": ('<path d="M12 2.5 21 6v6c0 5-3.6 8.3-9 10.5C6.6 20.3 3 17 3 12V6z" '
              'fill="none" stroke="currentColor" stroke-width="2" stroke-linejoin="round"/>'
              '<path d="m7.5 12 3 3 6-6" fill="none" stroke="currentColor" stroke-width="2" '
              'stroke-linecap="round" stroke-linejoin="round"/>'),
    "qradar": ('<circle cx="10.5" cy="12" r="8" fill="none" stroke="currentColor" stroke-width="1.8"/>'
               '<path d="M10.5 4a8 8 0 0 1 8 8h-8zM10.5 12l6 5" fill="currentColor"/>'),
    "sentinelone": ('<path d="M12 2.5 21 6v6c0 5-3.6 8.3-9 10.5C6.6 20.3 3 17 3 12V6z" '
                    'fill="none" stroke="currentColor" stroke-width="2" stroke-linejoin="round"/>'
                    '<circle cx="12" cy="11" r="2.4" fill="currentColor"/>'
                    '<path d="M12 14v3" stroke="currentColor" stroke-width="2"/>'),
    "xcitium": ('<path d="M12 2.5 21 6v6c0 5-3.6 8.3-9 10.5C6.6 20.3 3 17 3 12V6z" '
                'fill="none" stroke="currentColor" stroke-width="2" stroke-linejoin="round"/>'
                '<path d="M12 7v9M7.5 11.5h9" stroke="currentColor" stroke-width="2" '
                'stroke-linecap="round"/>'),
    "azure": ('<path d="M7 18.5h10a4.5 4.5 0 0 0 .5-9A6 6 0 0 0 6 8.5a5 5 0 0 0 1 10z" '
              'fill="none" stroke="currentColor" stroke-width="2" stroke-linejoin="round"/>'),
    "agenticai": ('<g fill="none" stroke="currentColor" stroke-width="1.8">'
                  '<circle cx="12" cy="12" r="3"/><circle cx="5" cy="6" r="2"/>'
                  '<circle cx="19" cy="6" r="2"/><circle cx="5" cy="18" r="2"/>'
                  '<circle cx="19" cy="18" r="2"/></g>'
                  '<path d="m7 7.5 3 2.5m7-2.5-3 2.5m-7 7 3-2.5m7 2.5-3-2.5" '
                  'fill="none" stroke="currentColor" stroke-width="1.8"/>'),
    "mitreattack": ('<circle cx="12" cy="12" r="8.5" fill="none" stroke="currentColor" stroke-width="1.8"/>'
                    '<circle cx="12" cy="12" r="4.5" fill="none" stroke="currentColor" stroke-width="1.8"/>'
                    '<circle cx="12" cy="12" r="1.5" fill="currentColor"/>'),
}

# colour overrides so near-black brand colours stay visible on the dark card
COLOR_OVERRIDE = {"splunk": "65A637", "elastic": "00BFB3", "amazonwebservices": "FF9900",
                  "pfsense": "2F6FEB", "powershell": "4C9BE8", "linux": "FCC624"}

# chip labels differ from their slug where the brand name is longer
CHIP_NAMES = {"amazonwebservices": "AWS", "githubactions": "GitHub Actions",
              "virustotal": "VirusTotal", "openvas": "OpenVAS", "nexpose": "Nexpose",
              "moloCH": "MOLOCH", "openvpn": "OpenVPN", "pfsense": "pfSense",
              "sentinelone": "SentinelOne", "xcitium": "Xcitium XDR",
              "agenticai": "Agentic AI", "mitreattack": "MITRE ATT&CK",
              "azure": "Azure", "qradar": "QRadar", "wazuh": "Wazuh"}

# ------------------------------------------------------------- stack content
ORBITS = [
    dict(path="orb0", dur=26, ring="#38bdf8", speed=1.0, items=[
        dict(slug="splunk", color="#38bdf8", frac=0.0, hub=True,
             moons=[("wazuh", "#60a5fa", 0.0), ("qradar", "#2563eb", -3.5)]),
        dict(slug="sentinelone", color="#38bdf8", frac=1 / 3),
        dict(slug="xcitium", color="#60a5fa", frac=2 / 3),
    ]),
    dict(path="orb1", dur=19, ring="#ef4444", speed=-1.0, items=[
        dict(slug="nuclei", color="#ef4444", frac=0.0),
        dict(slug="nessus", color="#f97316", frac=1 / 3),
        dict(slug="qualys", color="#dc2626", frac=2 / 3),
    ]),
    dict(path="orb2", dur=33, ring="#a78bfa", speed=1.0, items=[
        dict(slug="amazonwebservices", color="#f59e0b", frac=0.0),
        dict(slug="azure", color="#60a5fa", frac=0.25),
        dict(slug="pfsense", color="#38bdf8", frac=0.5),
        dict(slug="openvpn", color="#2563eb", frac=0.75),
    ]),
]

CHIP_GROUPS = [
    ("BLUE TEAM // DEFENSE", "#38bdf8", [("splunk", "#38bdf8"), ("wazuh", "#60a5fa"),
                                           ("qradar", "#2563eb"), ("sentinelone", "#38bdf8"),
                                           ("xcitium", "#60a5fa")]),
    ("RED TEAM // OFFENSE", "#ef4444", [("nuclei", "#fb7185"), ("nessus", "#f97316"),
                                          ("qualys", "#dc2626"), ("openvas", "#ef4444"),
                                          ("nexpose", "#f87171")]),
    ("PURPLE TEAM // AUTOMATION", "#a78bfa", [("python", "#c084fc"), ("bash", "#a78bfa"),
                                                 ("powershell", "#60a5fa"), ("agenticai", "#a78bfa"),
                                                 ("mitreattack", "#8b5cf6")]),
    ("CLOUD // NETWORK", "#f59e0b", [("amazonwebservices", "#f59e0b"), ("azure", "#60a5fa"),
                                        ("pfsense", "#38bdf8"), ("openvpn", "#2563eb"),
                                        ("cisco", "#0ea5e9")]),
]

# elliptical orbit geometry: (rx, ry, rotation deg, start point, sweep direction)
ORB_GEOM = {
    "orb0": dict(rx=172, ry=105, rot=0, start=(434.0, 290.0), sweep=1),
    "orb1": dict(rx=172, ry=105, rot=60, start=(348.0, 439.0), sweep=1),
    "orb2": dict(rx=172, ry=105, rot=120, start=(176.0, 439.0), sweep=1),
}


# ------------------------------------------------------------------- helpers
def ellipse_point(orbit, frac):
    """Point at `frac` of the way round an elliptical orbit (0 = path start).

    Every orbit starts at theta=0 in its own rotated frame, so the centre is
    recovered by rotating the start point back by -rot.
    """
    g = ORB_GEOM[orbit]
    rx, ry = g["rx"], g["ry"]
    rot = math.radians(g["rot"])
    sx, sy = g["start"]
    cx = sx - rx * math.cos(rot)
    cy = sy - rx * math.sin(rot)
    theta = g["sweep"] * 2 * math.pi * frac
    ex = rx * math.cos(theta)
    ey = ry * math.sin(theta)
    return (cx + ex * math.cos(rot) - ey * math.sin(rot),
            cy + ex * math.sin(rot) + ey * math.cos(rot))


def chip_width(label):
    return round(len(label) * 7.73 + 55)


def icon_markup(slug, color, scale):
    if slug in CUSTOM_GLYPHS:
        body = CUSTOM_GLYPHS[slug]
    else:
        d = ICONS[slug]
        body = f'<path fill="currentColor" d="{d}"/>'
    off = -12 * scale
    return (f'<g transform="translate({off:.3f},{off:.3f}) scale({scale})" '
            f'color="{color}" style="color:{color}">{body}</g>')


def moon_markup(slug, color, begin):
    return (f'<g><animateMotion dur="7s" begin="{begin:.1f}s" repeatCount="indefinite">'
            f'<mpath href="#moonPath"/></animateMotion>'
            f'<circle r="13" fill="#171a2c" stroke="{color}" stroke-opacity=".6" stroke-width="1.35"/>'
            f'{icon_markup(slug, color, 0.3683)}</g>')


def orbit_items():
    out = []
    idx = 0
    for orb in ORBITS:
        for it in orb["items"]:
            begin = -orb["dur"] * it["frac"] * orb["speed"]
            delay = 0.35 * idx
            dur = 1.5 + 0.15 * idx
            k = 0.667 + 0.03 * idx
            px, py = ellipse_point(orb["path"], it["frac"])
            if it.get("hub"):
                inner = (f'<circle r="36" fill="none" stroke="{orb["ring"]}" stroke-opacity=".3" '
                         f'stroke-width="1.2" stroke-dasharray="4 5"/>'
                         + "".join(moon_markup(s, c, b) for s, c, b in it["moons"])
                         + f'<circle r="22" fill="#171a2c" stroke="{it["color"]}" stroke-opacity=".6" '
                           f'stroke-width="1.35"/>'
                         + icon_markup(it["slug"], it["color"], 0.6233))
                static_inner = (f'<circle r="36" fill="none" stroke="{orb["ring"]}" stroke-opacity=".3" '
                                f'stroke-width="1.2" stroke-dasharray="4 5"/>'
                                + "".join(f'<g transform="translate({36 if i else -36},0)">'
                                          f'<circle r="13" fill="#171a2c" stroke="{c}" stroke-opacity=".6" '
                                          f'stroke-width="1.35"/>{icon_markup(s, c, 0.3683)}</g>'
                                          for i, (s, c, _) in enumerate(it["moons"]))
                                + f'<circle r="22" fill="#171a2c" stroke="{it["color"]}" stroke-opacity=".6" '
                                  f'stroke-width="1.35"/>'
                                + icon_markup(it["slug"], it["color"], 0.6233))
            else:
                inner = (f'<circle r="22" fill="#171a2c" stroke="{it["color"]}" stroke-opacity=".6" '
                         f'stroke-width="1.35"/>'
                         + icon_markup(it["slug"], it["color"], 0.6233))
                static_inner = inner
            out.append(
                f'<g opacity="0"><animate attributeName="opacity" values="0;0;1;1" '
                f'keyTimes="0;{k:.3f};{k + 0.266:.3f};1" dur="{dur:.2f}s" begin="{delay:.2f}s" fill="freeze"/>'
                f'<animateMotion dur="{orb["dur"]}s" begin="{begin:.3f}s" repeatCount="indefinite">'
                f'<mpath href="#{orb["path"]}"/></animateMotion>{inner}</g>'
                f'<g transform="translate({px:.1f},{py:.1f})">'
                f'<animate attributeName="opacity" to="0" dur=".01s" begin="0s" fill="freeze"/>'
                f'{static_inner}</g>')
            idx += 1
    return "".join(out)


def orbit_paths():
    out = []
    for i, orb in enumerate(ORBITS):
        d = re.search(rf'<path id="{orb["path"]}" d="([^"]+)"', (SRC / "stack.svg.tpl").read_text("utf-8")).group(1)
        out.append(f'<path d="{d}" fill="none" stroke="{orb["ring"]}" stroke-opacity=".22" '
                   f'stroke-width="1.6" stroke-dasharray="1400" stroke-dashoffset="0">'
                   f'<animate attributeName="stroke-dashoffset" values="1400;1400;0" keyTimes="0;0.111;1" '
                   f'dur="{1.8 + 0.2 * i:.1f}s" begin="0s" fill="freeze"/></path>')
    return "".join(out)


def chip_groups():
    out = []
    n = 0
    for gi, (label, accent, chips) in enumerate(CHIP_GROUPS):
        y = 128 + 80 * gi
        out.append(f'<g class="chip" style="animation-delay:{0.5 + 0.06 * gi:.2f}s">'
                   f'<rect x="552" y="{y}" width="14" height="3" rx="1.5" fill="{accent}"/>'
                   f'<text class="jbb" x="574" y="{y + 5}" font-size="11.5" fill="#8d93ab" '
                   f'letter-spacing="2">{label.replace("&", "&amp;")}</text></g>')
        x = 552.0
        for slug, color in chips:
            name = CHIP_NAMES.get(slug, slug)
            w = chip_width(name)
            out.append(
                f'<g class="chip" style="animation-delay:{0.6 + 0.06 * n:.2f}s">'
                f'<rect x="{x:.1f}" y="{y + 20}" width="{w}" height="40" rx="12" fill="{color}" fill-opacity=".08"/>'
                f'<rect x="{x + 0.5:.1f}" y="{y + 20.5}" width="{w - 1}" height="39" rx="11.5" fill="none" '
                f'stroke="{color}" stroke-opacity=".3">'
                f'<animate attributeName="stroke-opacity" values=".3;1;.3;.3" keyTimes="0;.04;.14;1" '
                f'dur="7.20s" begin="{2.5 + 0.45 * n:.2f}s" repeatCount="indefinite"/></rect>'
                f'<g transform="translate({x + 22:.1f},{y + 40})">{icon_markup(slug, color, 0.8333)}</g>'
                f'<text class="jb" x="{x + 41:.1f}" y="{y + 44.5}" font-size="13" fill="#eceef6">{html.escape(name)}</text></g>')
            x += w + 9
            n += 1
    return "".join(out)


# --------------------------------------------------------------------- build
def load():
    global ICONS
    ICONS = json.loads((TOOLS / "icons.json").read_text("utf-8"))


def main():
    load()
    fonts = {tok: base64.b64encode((TOOLS / "fonts" / f"{fam}.woff2").read_bytes()).decode()
             for tok, fam in FONT_KEYS.items()}
    assets = json.loads((TOOLS / "assets.json").read_text("utf-8"))
    extra = {
        "__ORBIT_ITEMS__": orbit_items(),
        "__ORBIT_PATHS__": orbit_paths(),
        "__CHIP_GROUPS__": chip_groups(),
        "__FRAMES__": assets["__FRAMES__"],
        "__BADGE__": assets["__BADGE__"],
        "__CHARACTER__": assets["__CHARACTER__"],
        **fonts,
    }
    for tpl in sorted(SRC.glob("*.tpl")):
        svg = tpl.read_text("utf-8")
        svg = re.sub(r"__ICON_(\w+)__", lambda m: ICONS[m.group(1)], svg)
        for tok, val in extra.items():
            svg = svg.replace(tok, val)
        left = re.findall(r"__[A-Z_]+__", svg)
        if left:
            print("UNRESOLVED", tpl.name, set(left))
        out = ROOT / tpl.name.replace(".tpl", "")
        out.write_text(svg, encoding="utf-8")
        print(f"{out.name:20} {len(svg)/1024:8.1f} KB")


if __name__ == "__main__":
    main()
