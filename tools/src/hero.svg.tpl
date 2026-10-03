<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 360" width="1200" height="360" role="img" aria-labelledby="title desc">
<title id="title">Omar Mahmood | SOC and Red Team Lead</title>
<desc id="desc">Animated cyber operations banner with a glowing OM shield, animated radar, and SOC, red team, and purple team specialties.</desc>
<defs>
  <linearGradient id="bg" x1="0" y1="0" x2="1" y2="1">
    <stop stop-color="#080d18"/>
    <stop offset="1" stop-color="#111a2c"/>
  </linearGradient>
  <linearGradient id="edge" x1="0" y1="0" x2="1" y2="1">
    <stop stop-color="#43e7d2" stop-opacity=".84"/>
    <stop offset=".52" stop-color="#667aff" stop-opacity=".5"/>
    <stop offset="1" stop-color="#fb5368" stop-opacity=".72"/>
  </linearGradient>
  <linearGradient id="beam" x1="0" y1="0" x2="1" y2="0">
    <stop stop-color="#43e7d2" stop-opacity="0"/>
    <stop offset=".48" stop-color="#43e7d2"/>
    <stop offset="1" stop-color="#a78bfa" stop-opacity="0"/>
  </linearGradient>
  <radialGradient id="cyanGlow">
    <stop stop-color="#10b7b3" stop-opacity=".2"/>
    <stop offset="1" stop-color="#10b7b3" stop-opacity="0"/>
  </radialGradient>
  <radialGradient id="redGlow">
    <stop stop-color="#ef4444" stop-opacity=".13"/>
    <stop offset="1" stop-color="#ef4444" stop-opacity="0"/>
  </radialGradient>
  <pattern id="grid" width="32" height="32" patternUnits="userSpaceOnUse">
    <path d="M32 0H0V32" fill="none" stroke="#bdc9dc" stroke-opacity=".045"/>
  </pattern>
  <style>
    text { font-family: Inter, "Segoe UI", Arial, sans-serif; }
    .scan { stroke-dasharray: 120 1080; animation: scan 5s linear infinite; }
    .pulse { animation: pulse 2s ease-in-out infinite; }
    .faint { animation: fade 3.2s ease-in-out infinite; }
    @keyframes scan { to { stroke-dashoffset: -1200; } }
    @keyframes pulse { 0%,100% { opacity: .45; } 50% { opacity: 1; } }
    @keyframes fade { 0%,100% { opacity: .28; } 50% { opacity: .85; } }
    @media (prefers-reduced-motion: reduce) {
      .scan, .pulse, .faint { animation: none; }
    }
  </style>
</defs>
<rect width="1200" height="360" rx="24" fill="url(#bg)"/>
<ellipse cx="108" cy="177" rx="230" ry="225" fill="url(#cyanGlow)"/>
<ellipse cx="1090" cy="165" rx="250" ry="220" fill="url(#redGlow)"/>
<rect width="1200" height="360" rx="24" fill="url(#grid)"/>
<rect x="1" y="1" width="1198" height="358" rx="23" fill="none" stroke="url(#edge)" stroke-opacity=".62"/>
<path d="M232 38V322M800 38V322" stroke="#53647c" stroke-opacity=".2"/>

<!-- Animated operator mark -->
<g transform="translate(130 168)">
  <circle r="82" fill="#091522" fill-opacity=".42" stroke="#43e7d2" stroke-opacity=".26"/>
  <circle r="68" fill="none" stroke="#43e7d2" stroke-opacity=".25" stroke-dasharray="2 8"/>
  <g fill="none" stroke="#43e7d2" stroke-opacity=".75" stroke-width="1.4">
    <path d="M0-78V-65M78 0H65M0 78V65M-78 0h13"/>
    <animateTransform attributeName="transform" type="rotate" from="0" to="360" dur="24s" repeatCount="indefinite"/>
  </g>
  <path d="M0-53 42-37V2C42 29 23 47 0 59-23 47-42 29-42 2V-37Z" fill="#14263a" stroke="#43e7d2" stroke-width="2"/>
  <path d="M-26-29 0-39 26-29V2C26 21 14 35 0 43-14 35-26 21-26 2Z" fill="none" stroke="#617fff" stroke-opacity=".72"/>
  <text x="0" y="7" text-anchor="middle" fill="#f3f7ff" font-size="29" font-weight="750" letter-spacing="1">OM</text>
  <circle cx="49" cy="-45" r="5" fill="#43e7d2" class="pulse"/>
  <circle cx="49" cy="-45" r="10" fill="none" stroke="#43e7d2" stroke-opacity=".5" class="faint"/>
</g>

<!-- Clear, readable introduction -->
<text x="270" y="91" fill="#43e7d2" font-size="12" font-weight="700" letter-spacing="2.8">CYBER OPERATIONS  /  LAHORE, PAKISTAN</text>
<text x="266" y="158" fill="#f3f6fb" font-size="49" font-weight="750" letter-spacing="-1.5">Omar Mahmood</text>
<text x="270" y="202" fill="#81e8e1" font-size="24" font-weight="650">SOC &amp; Red Team Lead</text>
<text x="270" y="232" fill="#afbdd0" font-size="13.5" font-weight="550" letter-spacing="1.1">DETECTION ENGINEERING  /  INCIDENT RESPONSE  /  ADVERSARY SIMULATION</text>

<!-- Focus badges -->
<g font-size="10" font-weight="700" letter-spacing="1.25">
  <rect x="270" y="259" width="124" height="31" rx="15.5" fill="#0b262b" stroke="#43e7d2" stroke-opacity=".62"/>
  <circle cx="287" cy="274.5" r="3" fill="#43e7d2"/>
  <text x="299" y="278" fill="#b9f4ed">BLUE TEAM</text>
  <rect x="405" y="259" width="124" height="31" rx="15.5" fill="#29171f" stroke="#fb5368" stroke-opacity=".62"/>
  <circle cx="422" cy="274.5" r="3" fill="#fb5368"/>
  <text x="434" y="278" fill="#ffc4c9">RED TEAM</text>
  <rect x="540" y="259" width="146" height="31" rx="15.5" fill="#201a32" stroke="#a78bfa" stroke-opacity=".68"/>
  <circle cx="557" cy="274.5" r="3" fill="#a78bfa"/>
  <text x="569" y="278" fill="#ded3ff">PURPLE TEAM</text>
</g>

<!-- Animated radar and focus matrix -->
<g>
  <rect x="820" y="52" width="340" height="256" rx="18" fill="#0b1321" fill-opacity=".88" stroke="#8ea4c5" stroke-opacity=".22"/>
  <path d="M820 103H1160" stroke="#8ea4c5" stroke-opacity=".18"/>
  <text x="842" y="84" fill="#a9bad0" font-size="10.5" font-weight="700" letter-spacing="2">TACTICAL FOCUS</text>
  <text x="1138" y="84" text-anchor="end" fill="#43e7d2" font-size="9" font-weight="700" letter-spacing="1.2">OX19 PROFILE</text>
  <g font-size="10" font-weight="700" letter-spacing="1">
    <circle cx="848" cy="136" r="4" fill="#43e7d2"/>
    <text x="862" y="140" fill="#f1f5fb">SOC OPERATIONS</text>
    <text x="862" y="158" fill="#8190a6" font-size="8.5" font-weight="500">DETECT  /  CONTAIN  /  RESPOND</text>
    <circle cx="848" cy="187" r="4" fill="#fb5368"/>
    <text x="862" y="191" fill="#f1f5fb">RED TEAM</text>
    <text x="862" y="209" fill="#8190a6" font-size="8.5" font-weight="500">ASSESS  /  EMULATE  /  REPORT</text>
    <circle cx="848" cy="238" r="4" fill="#a78bfa"/>
    <text x="862" y="242" fill="#f1f5fb">PURPLE TEAM</text>
    <text x="862" y="260" fill="#8190a6" font-size="8.5" font-weight="500">VALIDATE  /  AUTOMATE  /  IMPROVE</text>
  </g>
  <g transform="translate(1090 184)">
    <circle r="51" fill="#0a1724" stroke="#4d617c" stroke-opacity=".56"/>
    <circle r="38" fill="none" stroke="#43e7d2" stroke-opacity=".3" stroke-dasharray="2 5"/>
    <circle r="25" fill="none" stroke="#617fff" stroke-opacity=".35"/>
    <path d="M-50 0H50M0-50V50M-35-35 35 35M35-35-35 35" stroke="#72839b" stroke-opacity=".18"/>
    <g>
      <path d="M0 0V-48A48 48 0 0 1 34-34Z" fill="#43e7d2" fill-opacity=".2"/>
      <path d="M0 0V-48" stroke="#43e7d2" stroke-width="1.4" stroke-opacity=".8"/>
      <animateTransform attributeName="transform" type="rotate" from="0" to="360" dur="8s" repeatCount="indefinite"/>
    </g>
    <circle r="3.5" fill="#d7fff9"/>
    <circle cx="25" cy="-17" r="3" fill="#fb5368" class="pulse"/>
    <circle cx="-24" cy="20" r="2.5" fill="#a78bfa" class="faint"/>
  </g>
</g>

<!-- Moving signal along the lower edge -->
<path d="M38 330H1162" fill="none" stroke="#29394f" stroke-width="1.5"/>
<path class="scan" d="M38 330H1162" fill="none" stroke="url(#beam)" stroke-width="2.5" stroke-linecap="round"/>
</svg>
