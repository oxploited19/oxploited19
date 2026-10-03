<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1280 640" width="1280" height="640" role="img" aria-label="Red team, blue team, and purple team security operations"><title>Red team, blue team, and purple team operations</title><desc>Blue team defense, red team offense, and purple team validation capabilities, including SOC engineering, incident response, vulnerability assessment, and attack simulation.</desc><defs><style>@font-face{font-family:'SG';src:url(data:font/woff2;base64,__FONT_SG__) format('woff2')}@font-face{font-family:'SGM';src:url(data:font/woff2;base64,__FONT_SGM__) format('woff2')}@font-face{font-family:'JBM';src:url(data:font/woff2;base64,__FONT_JBM__) format('woff2')}@font-face{font-family:'JBMB';src:url(data:font/woff2;base64,__FONT_JBMB__) format('woff2')}
text{font-family:'JBM',ui-monospace,Menlo,Consolas,monospace}
.sg{font-family:'SG','Segoe UI',Helvetica,Arial,sans-serif;font-weight:700}
.sgm{font-family:'SGM','Segoe UI',Helvetica,Arial,sans-serif;font-weight:500}
.jb{font-family:'JBM',ui-monospace,Menlo,Consolas,monospace}
.jbb{font-family:'JBMB',ui-monospace,Menlo,Consolas,monospace;font-weight:700}
@keyframes fadeUp{from{opacity:0;transform:translateY(14px)}to{opacity:1;transform:translateY(0)}}
@keyframes fadeIn{from{opacity:0}to{opacity:1}}
@keyframes pulse{0%,100%{opacity:1}50%{opacity:.25}}
@keyframes ring{0%{r:4;opacity:.8}100%{r:13;opacity:0}}
.fu{animation:fadeUp .7s cubic-bezier(.2,.8,.2,1) both}
.fi{animation:fadeIn .7s ease both}
@media (prefers-reduced-motion:reduce){*{animation:none!important;opacity:1!important;transform:none!important}}

.slide{animation:slide 12s cubic-bezier(.2,.8,.2,1) infinite}
@keyframes slide{0%{opacity:0;transform:translateX(46px)}5%{opacity:1;transform:translateX(0)}29%{opacity:1;transform:translateX(0)}33.3%{opacity:0;transform:translateX(-46px)}100%{opacity:0;transform:translateX(-46px)}}
.cap{animation:cap 12s ease infinite}
@keyframes cap{0%{opacity:0;transform:translateY(10px)}6%{opacity:1;transform:translateY(0)}29%{opacity:1;transform:translateY(0)}33%{opacity:0;transform:translateY(-8px)}100%{opacity:0}}
.bgfade{animation:bgf 12s ease infinite}
@keyframes bgf{0%{opacity:0}4%{opacity:1}30%{opacity:1}35%{opacity:0}100%{opacity:0}}
.row{animation:rowIn .7s cubic-bezier(.2,.8,.2,1) both}
@keyframes rowIn{from{opacity:0;transform:translateX(-14px)}to{opacity:1;transform:translateX(0)}}
.cardL{animation:fadeUp .8s cubic-bezier(.2,.8,.2,1) .1s both}
.cardR{animation:fadeUp .8s cubic-bezier(.2,.8,.2,1) .3s both}
.cursor{animation:pulse 1s steps(1) infinite}
.blink{animation:pulse 1.1s steps(1) infinite}
.tw{animation:twk 2.6s ease-in-out infinite}
@keyframes twk{0%,100%{opacity:.3}50%{opacity:1}}
.dash{animation:dash 3s linear infinite}
@keyframes dash{to{stroke-dashoffset:-144}}
.sweep{animation:sweep 3.2s ease-in-out infinite alternate}
@keyframes sweep{from{transform:translateX(-6px)}to{transform:translateX(150px)}}
.glowp{animation:pulse 2.2s ease-in-out infinite}
</style>
<linearGradient id="edge" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="#38bdf8" stop-opacity=".6"/><stop offset=".5" stop-color="#262a42"/><stop offset="1" stop-color="#2563eb" stop-opacity=".5"/></linearGradient>
<linearGradient id="edgeR" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="#ef4444" stop-opacity=".6"/><stop offset=".5" stop-color="#262a42"/><stop offset="1" stop-color="#f97316" stop-opacity=".5"/></linearGradient>
<linearGradient id="cardbg" x1="0" y1="0" x2="0" y2="1"><stop offset="0" stop-color="#171a2c"/><stop offset="1" stop-color="#121423"/></linearGradient>
<linearGradient id="barG" x1="0" y1="0" x2="1" y2="0"><stop offset="0" stop-color="#38bdf8"/><stop offset="1" stop-color="#2563eb"/></linearGradient>
<clipPath id="winL"><rect x="28" y="118" width="564" height="352" rx="14"/></clipPath>
<clipPath id="winR"><rect x="688" y="118" width="564" height="352" rx="14"/></clipPath>
<pattern id="dots2" width="22" height="22" patternUnits="userSpaceOnUse"><circle cx="11" cy="11" r=".8" fill="#fff" fill-opacity=".05"/></pattern>
<linearGradient id="sbg0" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="#fee2e2"/><stop offset="1" stop-color="#fda4af"/></linearGradient><linearGradient id="sbg1" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="#fff1f2"/><stop offset="1" stop-color="#fecaca"/></linearGradient><linearGradient id="sbg2" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="#ffe4e6"/><stop offset="1" stop-color="#fda4af"/></linearGradient></defs>

<!-- ============ LEFT CARD : THREAT OPERATIONS ============ -->
<g class="cardL"><rect x="0" y="0" width="620" height="640" rx="24" fill="url(#cardbg)"/><rect x="0" y="0" width="620" height="640" rx="24" fill="url(#dots2)"/><rect x="0.75" y=".75" width="618.5" height="638.5" rx="23.25" fill="none" stroke="url(#edge)" stroke-width="1.5"/></g>
<g class="cardL">
  <text class="jbb" x="28" y="46" font-size="12.5" fill="#38bdf8" letter-spacing="2.2">// BLUE TEAM // DEFENSE</text>
  <text class="sg" x="28" y="86" font-size="29" fill="#eceef6" letter-spacing="-.5">Detect, contain, recover</text>

  <!-- fake browser window with the live SOC console -->
  <g clip-path="url(#winL)">
    <rect x="28" y="118" width="564" height="352" fill="#0f1224"/>
    <rect x="28" y="118" width="564" height="34" fill="#1c2036"/>
    <circle cx="46" cy="135" r="5" fill="#ff5f57"/><circle cx="62" cy="135" r="5" fill="#febc2e"/><circle cx="78" cy="135" r="5" fill="#28c840"/>
    <rect x="178" y="126" width="264" height="18" rx="9" fill="#0b0e1a"/>
    <text class="jb" x="310" y="139" font-size="11" fill="#8d93ab" text-anchor="middle">soc://blue-team/training-range</text>
    <rect class="cursor" x="414" y="130" width="1.5" height="11" fill="#38bdf8"/>

    <text class="jbb" x="44" y="176" font-size="10" fill="#38bdf8" letter-spacing="1.8">SIMULATED HUNT // SAMPLE EVENTS</text>
    <g class="fu" style="animation-delay:.75s"><circle cx="516" cy="172" r="4" fill="#ef4444"><animate attributeName="opacity" values="1;.2;1" dur="1.5s" repeatCount="indefinite"/></circle><text class="jbb" x="576" y="176" font-size="10" fill="#ef4444" text-anchor="end" letter-spacing="1.6">LAB SCENARIO</text></g>

    <!-- alert rows -->
    <g class="row" style="animation-delay:.9s">
      <rect x="44" y="190" width="532" height="28" rx="9" fill="#ef4444" fill-opacity=".07" stroke="#ef4444" stroke-opacity=".3"/>
      <rect x="44" y="190" width="3" height="28" rx="1.5" fill="#ef4444"/>
      <rect x="56" y="196" width="40" height="16" rx="8" fill="#ef4444" fill-opacity=".18" stroke="#ef4444" stroke-opacity=".55"/>
      <text class="jbb" x="76" y="207" font-size="8.5" fill="#fca5a5" text-anchor="middle" letter-spacing=".8">CRIT</text>
      <text class="jb" x="104" y="208" font-size="10.5" fill="#a78bfa">T1566.001</text>
      <text class="jb" x="176" y="208" font-size="10.5" fill="#eceef6" opacity=".88">Spearphishing attachment opened in finance mail</text>
      <text class="jb" x="566" y="208" font-size="9.5" fill="#8d93ab" text-anchor="end">02:14</text>
    </g>
    <g class="row" style="animation-delay:1.04s">
      <rect x="44" y="226" width="532" height="28" rx="9" fill="#fbbf24" fill-opacity=".06" stroke="#fbbf24" stroke-opacity=".25"/>
      <rect x="44" y="226" width="3" height="28" rx="1.5" fill="#fbbf24"/>
      <rect x="56" y="232" width="40" height="16" rx="8" fill="#fbbf24" fill-opacity=".16" stroke="#fbbf24" stroke-opacity=".5"/>
      <text class="jbb" x="76" y="243" font-size="8.5" fill="#fcd34d" text-anchor="middle" letter-spacing=".8">HIGH</text>
      <text class="jb" x="104" y="244" font-size="10.5" fill="#a78bfa">T1059.003</text>
      <text class="jb" x="176" y="244" font-size="10.5" fill="#eceef6" opacity=".88">Encoded PowerShell spawned by winword.exe</text>
      <text class="jb" x="566" y="244" font-size="9.5" fill="#8d93ab" text-anchor="end">02:19</text>
    </g>
    <g class="row" style="animation-delay:1.18s">
      <rect x="44" y="262" width="532" height="28" rx="9" fill="#22d3ee" fill-opacity=".05" stroke="#22d3ee" stroke-opacity=".22"/>
      <rect x="44" y="262" width="3" height="28" rx="1.5" fill="#22d3ee"/>
      <rect x="56" y="268" width="40" height="16" rx="8" fill="#22d3ee" fill-opacity=".14" stroke="#22d3ee" stroke-opacity=".45"/>
      <text class="jbb" x="76" y="279" font-size="8.5" fill="#67e8f9" text-anchor="middle" letter-spacing=".8">MED</text>
      <text class="jb" x="104" y="280" font-size="10.5" fill="#a78bfa">T1078.004</text>
      <text class="jb" x="176" y="280" font-size="10.5" fill="#eceef6" opacity=".88">Cloud session token replayed from a new ASN</text>
      <text class="jb" x="566" y="280" font-size="9.5" fill="#8d93ab" text-anchor="end">02:26</text>
    </g>
    <g class="row" style="animation-delay:1.32s">
      <rect x="44" y="298" width="532" height="28" rx="9" fill="#8d93ab" fill-opacity=".05" stroke="#8d93ab" stroke-opacity=".2"/>
      <rect x="44" y="298" width="3" height="28" rx="1.5" fill="#8d93ab"/>
      <rect x="56" y="304" width="40" height="16" rx="8" fill="#8d93ab" fill-opacity=".14" stroke="#8d93ab" stroke-opacity=".4"/>
      <text class="jbb" x="76" y="315" font-size="8.5" fill="#c3c7d4" text-anchor="middle" letter-spacing=".8">LOW</text>
      <text class="jb" x="104" y="316" font-size="10.5" fill="#a78bfa">T1021.002</text>
      <text class="jb" x="176" y="316" font-size="10.5" fill="#eceef6" opacity=".88">Admin SMB share touched outside change window</text>
      <text class="jb" x="566" y="316" font-size="9.5" fill="#8d93ab" text-anchor="end">02:31</text>
    </g>

    <line x1="44" y1="340" x2="576" y2="340" stroke="#262a42"/>

    <!-- KPI tiles -->
    <g class="fu" style="animation-delay:1.46s"><rect x="44" y="350" width="170" height="58" rx="12" fill="#ffffff" fill-opacity=".03" stroke="#262a42"/><text class="jbb" x="58" y="370" font-size="9.5" fill="#8d93ab" letter-spacing="1.4">BLUE TEAM STACK</text><text class="sg" x="58" y="394" font-size="21" fill="#eceef6">SIEM + EDR/XDR</text><rect x="58" y="399" width="142" height="4" rx="2" fill="#ffffff" fill-opacity=".06"/><rect x="58" y="399" width="0" height="4" rx="2" fill="#38bdf8"><animate attributeName="width" values="0;0;110" keyTimes="0;.6;1" dur="1.6s" begin="0s" fill="freeze" calcMode="spline" keySplines="0 0 1 1;.2 .8 .2 1"/></rect></g>
    <g class="fu" style="animation-delay:1.58s"><rect x="222" y="350" width="170" height="58" rx="12" fill="#ffffff" fill-opacity=".03" stroke="#262a42"/><text class="jbb" x="236" y="370" font-size="9.5" fill="#8d93ab" letter-spacing="1.4">VAPT DELIVERY</text><text class="sg" x="236" y="394" font-size="21" fill="#eceef6">UP TO 3 DAYS</text><rect x="236" y="399" width="142" height="4" rx="2" fill="#ffffff" fill-opacity=".06"/><rect x="236" y="399" width="0" height="4" rx="2" fill="#ef4444"><animate attributeName="width" values="0;0;111" keyTimes="0;.6;1" dur="1.6s" begin="0s" fill="freeze" calcMode="spline" keySplines="0 0 1 1;.2 .8 .2 1"/></rect></g>
    <g class="fu" style="animation-delay:1.7s"><rect x="400" y="350" width="176" height="58" rx="12" fill="#ffffff" fill-opacity=".03" stroke="#262a42"/><text class="jbb" x="414" y="370" font-size="9.5" fill="#8d93ab" letter-spacing="1.4">CUSTOM AUTOMATION</text><text class="sg" x="414" y="394" font-size="21" fill="#eceef6">AGENTIC AI</text><rect x="414" y="399" width="148" height="4" rx="2" fill="#ffffff" fill-opacity=".06"/><rect x="414" y="399" width="0" height="4" rx="2" fill="#a78bfa"><animate attributeName="width" values="0;0;129" keyTimes="0;.6;1" dur="1.6s" begin="0s" fill="freeze" calcMode="spline" keySplines="0 0 1 1;.2 .8 .2 1"/></rect></g>

    <!-- ATT&CK tactic coverage strip -->
    <g class="fu" style="animation-delay:1.82s">
      <text class="jbb" x="44" y="430" font-size="9" fill="#8d93ab" letter-spacing="1.6">ATTACK SIMULATION &#183; DETECTION VALIDATION</text>
      <g fill="url(#barG)">
        <rect class="tw" x="44" y="438" width="40" height="18" rx="6" style="animation-delay:.1s"/>
        <rect class="tw" x="88" y="438" width="40" height="18" rx="6" style="animation-delay:.25s"/>
        <rect x="132" y="438" width="40" height="18" rx="6" opacity=".22"/>
        <rect x="176" y="438" width="40" height="18" rx="6" opacity=".3"/>
        <rect x="220" y="438" width="40" height="18" rx="6" opacity=".38"/>
        <rect class="tw" x="264" y="438" width="40" height="18" rx="6" opacity=".85" style="animation-delay:.4s"/>
        <rect x="308" y="438" width="40" height="18" rx="6" opacity=".62"/>
        <rect x="352" y="438" width="40" height="18" rx="6" opacity=".5"/>
        <rect x="396" y="438" width="40" height="18" rx="6" opacity=".42"/>
        <rect x="440" y="438" width="40" height="18" rx="6" opacity=".68"/>
        <rect class="tw" x="484" y="438" width="40" height="18" rx="6" opacity=".8" style="animation-delay:.55s"/>
        <rect x="528" y="438" width="48" height="18" rx="6" opacity=".3"/>
      </g>
    </g>
  </g>
  <rect x="28.5" y="118.5" width="563" height="351" rx="13.5" fill="none" stroke="#ffffff" stroke-opacity=".08"/>

  <!-- capability rows -->
  <g class="row" style="animation-delay:1.5s"><rect x="28" y="496" width="38" height="38" rx="10" fill="#22d3ee" fill-opacity=".12" stroke="#22d3ee" stroke-opacity=".35"/><g transform="translate(47,515)" fill="none" stroke="#22d3ee" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round"><path d="M0-9l9 4v8c0 6-4 10-9 12-5-2-9-6-9-12V-5z"/><path d="M-4 0l3 3 6-6"/></g><text class="sg" x="82" y="512" font-size="16" fill="#eceef6">SOC, SIEM and XDR engineering</text><text class="jb" x="82" y="530" font-size="12.5" fill="#8d93ab">Splunk, Wazuh, QRadar, SentinelOne and Xcitium</text></g>
  <g class="row" style="animation-delay:1.68s"><rect x="28" y="544" width="38" height="38" rx="10" fill="#38bdf8" fill-opacity=".12" stroke="#38bdf8" stroke-opacity=".35"/><g transform="translate(47,563)" fill="none" stroke="#38bdf8" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round"><circle cx="0" cy="-5" r="5"/><path d="M-8 9a8 8 0 0 1 16 0"/><path d="M12-9l5 5-5 5"/></g><text class="sg" x="82" y="560" font-size="16" fill="#eceef6">Incident response and threat hunting</text><text class="jb" x="82" y="578" font-size="12.5" fill="#8d93ab">MITRE ATT&amp;CK, Wireshark, MOLOCH and Security Onion</text></g>
  <g class="row" style="animation-delay:1.86s"><rect x="28" y="592" width="38" height="38" rx="10" fill="#ef4444" fill-opacity=".12" stroke="#ef4444" stroke-opacity=".35"/><g transform="translate(47,611)" fill="none" stroke="#ef4444" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round"><path d="M-9-8h18v13H-9z"/><path d="M-4-3l3 3-3 3"/><path d="M2 3h5"/></g><text class="sg" x="82" y="608" font-size="16" fill="#eceef6">Red team, VAPT and purple drills</text><text class="jb" x="82" y="626" font-size="12.5" fill="#8d93ab">Web exploitation, APT simulation and detection follow-up</text></g>
</g>

<!-- ============ RIGHT CARD : OFF THE CLOCK ============ -->
<g class="cardR"><rect x="660" y="0" width="620" height="640" rx="24" fill="url(#cardbg)"/><rect x="660" y="0" width="620" height="640" rx="24" fill="url(#dots2)"/><rect x="660.75" y=".75" width="618.5" height="638.5" rx="23.25" fill="none" stroke="url(#edgeR)" stroke-width="1.5"/></g>
<g class="cardR">
  <text class="jbb" x="688" y="46" font-size="12.5" fill="#ef4444" letter-spacing="2.2">// RED TEAM // OFFENSE</text>
  <text class="sg" x="688" y="86" font-size="29" fill="#eceef6" letter-spacing="-.5">Emulate, exploit, validate</text>

  <g clip-path="url(#winR)">
    <rect x="688" y="118" width="564" height="352" fill="#f6f3ff"/>

    <!-- slide 1 : threat intel research -->
    <g class="bgfade" opacity="1" style="animation-delay:0s"><rect x="688" y="118" width="564" height="352" fill="url(#sbg0)"/></g>
    <g class="slide" opacity="1" style="animation-delay:0s"><g transform="translate(700,160)">
      <circle cx="140" cy="150" r="104" fill="#ffffff" fill-opacity=".45" stroke="#dc2626" stroke-width="2.5"/>
      <ellipse cx="140" cy="150" rx="42" ry="104" fill="none" stroke="#dc2626" stroke-opacity=".55" stroke-width="1.6"/>
      <ellipse cx="140" cy="150" rx="84" ry="104" fill="none" stroke="#dc2626" stroke-opacity=".4" stroke-width="1.6"/>
      <ellipse cx="140" cy="150" rx="104" ry="72" fill="none" stroke="#dc2626" stroke-opacity=".28" stroke-width="1.4"/>
      <ellipse cx="140" cy="150" rx="104" ry="38" fill="none" stroke="#dc2626" stroke-opacity=".45" stroke-width="1.6"/>
      <path d="M36 150h208" stroke="#dc2626" stroke-opacity=".45" stroke-width="1.6"/>
      <path class="dash" d="M98 104C168 122 224 132 266 150" fill="none" stroke="#7f1d1d" stroke-width="2" stroke-dasharray="6 7"/>
      <path class="dash" d="M186 86C226 108 250 132 266 150" fill="none" stroke="#7f1d1d" stroke-width="2" stroke-dasharray="6 7" style="animation-delay:-1.4s"/>
      <path class="dash" d="M176 212C226 194 250 170 266 150" fill="none" stroke="#7f1d1d" stroke-width="2" stroke-dasharray="6 7" style="animation-delay:-2.3s"/>
      <g><circle cx="98" cy="104" r="6" fill="#EF6C4D"/><circle cx="98" cy="104" r="6" fill="none" stroke="#EF6C4D" stroke-width="2"><animate attributeName="r" values="6;20" dur="2.2s" repeatCount="indefinite"/><animate attributeName="opacity" values=".9;0" dur="2.2s" repeatCount="indefinite"/></circle></g>
      <g><circle cx="186" cy="86" r="6" fill="#EF6C4D"/><circle cx="186" cy="86" r="6" fill="none" stroke="#EF6C4D" stroke-width="2"><animate attributeName="r" values="6;20" dur="2.2s" begin="-.7s" repeatCount="indefinite"/><animate attributeName="opacity" values=".9;0" dur="2.2s" begin="-.7s" repeatCount="indefinite"/></circle></g>
      <g><circle cx="176" cy="212" r="6" fill="#EF6C4D"/><circle cx="176" cy="212" r="6" fill="none" stroke="#EF6C4D" stroke-width="2"><animate attributeName="r" values="6;20" dur="2.2s" begin="-1.4s" repeatCount="indefinite"/><animate attributeName="opacity" values=".9;0" dur="2.2s" begin="-1.4s" repeatCount="indefinite"/></circle></g>
      <g transform="translate(266,150)">
        <circle r="28" fill="#ffffff" stroke="#7f1d1d" stroke-width="2.5"/>
        <circle r="34" fill="none" stroke="#7f1d1d" stroke-opacity=".3" stroke-width="2"><animate attributeName="r" values="28;46" dur="3s" repeatCount="indefinite"/><animate attributeName="opacity" values=".7;0" dur="3s" repeatCount="indefinite"/></circle>
        <path d="M0-14l11 6v10c0 8-5 13-11 16-6-3-11-8-11-16V-8z" fill="#7f1d1d"/>
      </g>
      <g transform="translate(316,64)">
        <rect width="196" height="150" rx="14" fill="#ffffff" stroke="#2F8F6B" stroke-opacity=".35" stroke-width="2"/>
        <rect x="16" y="18" width="72" height="9" rx="4.5" fill="#7f1d1d" fill-opacity=".75"/>
        <rect x="16" y="38" width="150" height="7" rx="3.5" fill="#dc2626" fill-opacity=".28"/>
        <rect x="16" y="52" width="164" height="7" rx="3.5" fill="#dc2626" fill-opacity=".2"/>
        <rect x="16" y="66" width="128" height="7" rx="3.5" fill="#dc2626" fill-opacity=".2"/>
        <rect x="16" y="86" width="62" height="17" rx="8.5" fill="#EF6C4D" fill-opacity=".16" stroke="#EF6C4D" stroke-opacity=".5"/>
        <text class="jbb" x="47" y="98" font-size="9" fill="#c2410c" text-anchor="middle" letter-spacing="1">CRITICAL</text>
        <circle cx="158" cy="120" r="15" fill="none" stroke="#7f1d1d" stroke-width="3"/>
        <path d="M168 130l13 13" stroke="#7f1d1d" stroke-width="3.5" stroke-linecap="round"/>
      </g>
      <g transform="translate(58,262)"><rect width="96" height="24" rx="12" fill="#ffffff" fill-opacity=".8" stroke="#dc2626" stroke-opacity=".3"/><text class="jbb" x="48" y="16" font-size="10" fill="#7f1d1d" text-anchor="middle" letter-spacing="1.2">CVE FEEDS</text></g>
    </g></g>

    <!-- slide 2 : CTF and hacking labs -->
    <g class="bgfade" opacity="0" style="animation-delay:4s"><rect x="688" y="118" width="564" height="352" fill="url(#sbg1)"/></g>
    <g class="slide" opacity="0" style="animation-delay:4s"><g transform="translate(700,160)">
      <g transform="translate(74,58)">
        <rect x="0" y="0" width="268" height="164" rx="12" fill="#1b2350" stroke="#4c5fd5" stroke-width="2.5"/>
        <rect x="14" y="14" width="240" height="136" rx="8" fill="#0e1330"/>
        <rect class="blink" x="26" y="30" width="9" height="9" rx="2" fill="#4ade80"/>
        <rect x="43" y="30" width="98" height="9" rx="4.5" fill="#8fa3ff" fill-opacity=".85"/>
        <rect x="26" y="50" width="150" height="8" rx="4" fill="#8fa3ff" fill-opacity=".45"/>
        <rect x="26" y="68" width="118" height="8" rx="4" fill="#8fa3ff" fill-opacity=".45"/>
        <rect x="26" y="86" width="176" height="8" rx="4" fill="#4ade80" fill-opacity=".8"/>
        <rect x="26" y="104" width="104" height="8" rx="4" fill="#8fa3ff" fill-opacity=".3"/>
        <rect class="blink" x="26" y="122" width="9" height="9" rx="2" fill="#4ade80" style="animation-delay:.4s"/>
        <rect x="43" y="122" width="74" height="9" rx="4.5" fill="#f5a524" fill-opacity=".85"/>
        <path d="M-26 164h320l20 30h-360z" fill="#2a3364"/>
      </g>
      <path class="dash" d="M366 130C392 150 402 176 396 208" fill="none" stroke="#4c5fd5" stroke-width="2.5" stroke-dasharray="7 8"/>
      <g transform="translate(452,96)">
        <path d="M0 0v88" stroke="#1b2350" stroke-width="5" stroke-linecap="round"/>
        <path d="M4 4h58l-15 19 15 19H4z" fill="#f5a524" stroke="#1b2350" stroke-width="3" stroke-linejoin="round"/>
        <text class="jbb" x="33" y="66" font-size="11" fill="#1b2350" text-anchor="middle" letter-spacing="1">FLAG</text>
      </g>
      <g transform="translate(438,224)">
        <path d="M-14-6v-8a14 14 0 0 1 28 0v8" fill="none" stroke="#4c5fd5" stroke-width="4" stroke-linecap="round"/>
        <rect x="-21" y="-6" width="42" height="33" rx="9" fill="#4c5fd5"/>
        <circle cy="8" r="4" fill="#ffe9d6"/>
        <path d="M0 12v9" stroke="#ffe9d6" stroke-width="4" stroke-linecap="round"/>
      </g>
      <g transform="translate(60,246)">
        <path d="M0-27l23 13v27L0 26l-23-13v-27z" fill="#ffffff" fill-opacity=".75" stroke="#4c5fd5" stroke-width="2.5" stroke-linejoin="round"/>
        <path d="M0-13l11 6v13L0 12l-11-6V-7z" fill="#4c5fd5" fill-opacity=".22"/>
        <circle r="5" fill="#EF6C4D"/>
      </g>
      <g transform="translate(150,266)"><rect width="150" height="24" rx="12" fill="#ffffff" fill-opacity=".8" stroke="#4c5fd5" stroke-opacity=".3"/><text class="jbb" x="75" y="16" font-size="10" fill="#1b2350" text-anchor="middle" letter-spacing="1.2">PURPLE DRILLS</text></g>
    </g></g>

    <!-- slide 3 : purple-team validation -->
    <g class="bgfade" opacity="0" style="animation-delay:8s"><rect x="688" y="118" width="564" height="352" fill="url(#sbg2)"/></g>
    <g class="slide" opacity="0" style="animation-delay:8s"><g transform="translate(700,160)">
      <rect x="22" y="44" width="470" height="244" rx="20" fill="#fff" fill-opacity=".46" stroke="#7c3aed" stroke-opacity=".35" stroke-width="2"/>
      <text class="jbb" x="48" y="78" font-size="11" fill="#6d28d9" letter-spacing="1.6">ATTACK PATH REPLAY</text>
      <path d="M112 166H218M278 166H382" fill="none" stroke="#7c3aed" stroke-width="4" stroke-dasharray="8 8" class="dash"/>
      <g transform="translate(112,166)"><circle r="38" fill="#fee2e2" stroke="#dc2626" stroke-width="3"/><path d="M-12-9l12 9-12 9M4 9h12" fill="none" stroke="#b91c1c" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/></g>
      <g transform="translate(248,166)"><circle r="46" fill="#ede9fe" stroke="#7c3aed" stroke-width="3"/><path d="M0-23l19 8v16c0 13-8 22-19 27-11-5-19-14-19-27v-16z" fill="#7c3aed"/><path d="M-9 0l7 7 13-15" fill="none" stroke="#fff" stroke-width="4" stroke-linecap="round" stroke-linejoin="round"/></g>
      <g transform="translate(390,166)"><circle r="38" fill="#dbeafe" stroke="#2563eb" stroke-width="3"/><path d="M-17-10h34v22h-34zM-9-2h18M-9 5h12" fill="none" stroke="#1d4ed8" stroke-width="3" stroke-linecap="round"/></g>
      <text class="jbb" x="112" y="228" font-size="10" fill="#991b1b" text-anchor="middle">SIMULATE</text>
      <text class="jbb" x="248" y="238" font-size="10" fill="#6d28d9" text-anchor="middle">PURPLE TEAM</text>
      <text class="jbb" x="390" y="228" font-size="10" fill="#1d4ed8" text-anchor="middle">DETECT</text>
      <g transform="translate(58,260)"><rect width="166" height="24" rx="12" fill="#fff" fill-opacity=".8" stroke="#7c3aed" stroke-opacity=".3"/><text class="jbb" x="83" y="16" font-size="10" fill="#6d28d9" text-anchor="middle" letter-spacing="1.2">PURPLE DRILLS</text></g>
    </g></g>

    <!-- instagram style segment progress -->
    <rect x="708.0" y="132" width="169.3" height="3.5" rx="1.75" fill="#0d0e16" fill-opacity=".18"/><rect x="708.0" y="132" width="0" height="3.5" rx="1.75" fill="#0d0e16" fill-opacity=".7"><animate attributeName="width" values="0;0;169.3;169.3" keyTimes="0;0.02;0.3333;1" dur="12s" repeatCount="indefinite"/></rect>
    <rect x="885.3" y="132" width="169.3" height="3.5" rx="1.75" fill="#0d0e16" fill-opacity=".18"/><rect x="885.3" y="132" width="0" height="3.5" rx="1.75" fill="#0d0e16" fill-opacity=".7"><animate attributeName="width" values="0;0;169.3;169.3" keyTimes="0;0.3333;0.6667;1" dur="12s" repeatCount="indefinite"/></rect>
    <rect x="1062.7" y="132" width="169.3" height="3.5" rx="1.75" fill="#0d0e16" fill-opacity=".18"/><rect x="1062.7" y="132" width="0" height="3.5" rx="1.75" fill="#0d0e16" fill-opacity=".7"><animate attributeName="width" values="0;0;169.3;169.3" keyTimes="0;0.6667;0.98;1" dur="12s" repeatCount="indefinite"/></rect>
  </g>
  <rect x="688.5" y="118.5" width="563" height="351" rx="13.5" fill="none" stroke="#ffffff" stroke-opacity=".08"/>

  <!-- captions -->
  <g class="cap" opacity="1" style="animation-delay:0s"><rect x="688" y="494" width="112" height="24" rx="12" fill="#ef4444" fill-opacity=".14" stroke="#ef4444" stroke-opacity=".45"/><text class="jbb" x="701" y="510" font-size="11.5" fill="#ef4444" letter-spacing="1.5">THREAT INTEL</text><text class="sg" x="814" y="512" font-size="20" fill="#eceef6">Map adversary infrastructure</text><text class="sgm" x="688" y="544" font-size="15.5" fill="#8d93ab">Pivot through indicators, CVEs, APT reporting and malware behavior.</text></g>
  <g class="cap" opacity="0" style="animation-delay:4s"><rect x="688" y="494" width="112" height="24" rx="12" fill="#ef4444" fill-opacity=".14" stroke="#ef4444" stroke-opacity=".45"/><text class="jbb" x="701" y="510" font-size="11.5" fill="#ef4444" letter-spacing="1.5">CTF &amp; LABS</text><text class="sg" x="814" y="512" font-size="20" fill="#eceef6">Break the path first</text><text class="sgm" x="688" y="544" font-size="15.5" fill="#8d93ab">Exploit chains, web VAPT and adversary emulation.</text></g>
  <g class="cap" opacity="0" style="animation-delay:8s"><rect x="688" y="494" width="96" height="24" rx="12" fill="#a78bfa" fill-opacity=".14" stroke="#a78bfa" stroke-opacity=".45"/><text class="jbb" x="701" y="510" font-size="11.5" fill="#a78bfa" letter-spacing="1.5">PURPLE TEAM</text><text class="sg" x="798" y="512" font-size="20" fill="#eceef6">Validate the defense</text><text class="sgm" x="688" y="544" font-size="15.5" fill="#8d93ab">Replay attack paths against detections and response playbooks.</text></g>

  <text class="jbb" x="1252" y="602" font-size="11" fill="#8d93ab" text-anchor="end" letter-spacing="1.8">DAILY RINGS</text>
  <circle cx="706" cy="598" r="13" fill="none" stroke="#34d399" stroke-opacity=".18" stroke-width="5"/><circle cx="706" cy="598" r="13" fill="none" stroke="#34d399" stroke-width="5" stroke-linecap="round" stroke-dasharray="81.7" stroke-dashoffset="81.7" transform="rotate(-90 706 598)"><animate attributeName="stroke-dashoffset" values="81.7;10.9;10.9;81.7" keyTimes="0;.25;.9;1" dur="12s" begin="1s" repeatCount="indefinite"/></circle><text class="sgm" x="730" y="603" font-size="14" fill="#eceef6">Intel</text>
  <circle cx="856" cy="598" r="13" fill="none" stroke="#22d3ee" stroke-opacity=".18" stroke-width="5"/><circle cx="856" cy="598" r="13" fill="none" stroke="#22d3ee" stroke-width="5" stroke-linecap="round" stroke-dasharray="81.7" stroke-dashoffset="81.7" transform="rotate(-90 856 598)"><animate attributeName="stroke-dashoffset" values="81.7;16.3;16.3;81.7" keyTimes="0;.25;.9;1" dur="12s" begin="1s" repeatCount="indefinite"/></circle><text class="sgm" x="880" y="603" font-size="14" fill="#eceef6">Labs</text>
  <circle cx="1006" cy="598" r="13" fill="none" stroke="#a78bfa" stroke-opacity=".18" stroke-width="5"/><circle cx="1006" cy="598" r="13" fill="none" stroke="#a78bfa" stroke-width="5" stroke-linecap="round" stroke-dasharray="81.7" stroke-dashoffset="81.7" transform="rotate(-90 1006 598)"><animate attributeName="stroke-dashoffset" values="81.7;4.1;4.1;81.7" keyTimes="0;.25;.9;1" dur="12s" begin="1s" repeatCount="indefinite"/></circle><text class="sgm" x="1030" y="603" font-size="14" fill="#eceef6">Purple</text>
</g>
</svg>
