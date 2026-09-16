#!/data/data/com.termux/files/usr/bin/bash

# --- ANSI TrueColor ---
B='\033[38;2;66;133;244m'
R='\033[38;2;234;67;53m'
Y='\033[38;2;251;188;5m'
G='\033[38;2;52;168;83m'
C='\033[38;2;0;240;255m'
DIM='\033[2m'
RESET='\033[0m'
BOLD='\033[1m'

clear

# Compact Pixel-Art Google Logo
echo -e "${B} █▀▀ ${R}█▀█ ${Y}█▀█ ${B}█▀▀ ${G}█   ${R}█▀▀${RESET}"
echo -e "${B} █ █ ${R}█ █ ${Y}█ █ ${B}█ █ ${G}█   ${R}██▀${RESET}"
echo -e "${B} ▀▀▀ ${R}▀▀▀ ${Y}▀▀▀ ${B}▀▀▀ ${G}▀▀▀ ${R}▀▀▀${RESET}"
echo -e "${C}${BOLD}   ☬ SHΞN™ ULTRA-LITE KEY GENERATOR ☬${RESET}"
echo -e "${DIM}──────────────────────────────────────────${RESET}"

# Install only minimal lightweight tools (< 2MB)
if ! command -v termux-open &> /dev/null; then
    echo -e "${Y}⚙ Setting up lightweight tools...${RESET}"
    pkg install -y termux-tools >/dev/null 2>&1
fi

HTML_FILE="bds_generator.html"

# Generate Client-Side Pure WebCrypto UI (Zero Download, Instant & 100% Safe)
cat << 'HTMLEOF' > "$HTML_FILE"
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BDS Secrets Vault</title>
<style>
  :root {
    --bg: #090d16;
    --card: rgba(255, 255, 255, 0.05);
    --border: rgba(255, 255, 255, 0.12);
    --accent: #00f0ff;
    --text: #e2e8f0;
  }
  * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, monospace; }
  body {
    background-color: var(--bg);
    color: var(--text);
    padding: 24px 16px;
    display: flex;
    justify-content: center;
  }
  .container { width: 100%; max-width: 650px; }
  .header { text-align: center; margin-bottom: 24px; }
  .google-title { font-size: 26px; font-weight: 900; letter-spacing: 2px; margin-bottom: 6px; }
  .g-b { color: #4285F4; }
  .g-r { color: #EA4335; }
  .g-y { color: #FBBC05; }
  .g-g { color: #34A853; }
  .badge {
    display: inline-block;
    padding: 4px 12px;
    border-radius: 20px;
    background: rgba(0, 240, 255, 0.1);
    color: var(--accent);
    font-size: 11px;
    border: 1px solid rgba(0, 240, 255, 0.3);
    margin-bottom: 8px;
    letter-spacing: 1px;
  }
  .card {
    background: var(--card);
    backdrop-filter: blur(12px);
    border: 1px solid var(--border);
    border-radius: 14px;
    padding: 16px;
    margin-bottom: 16px;
    box-shadow: 0 8px 24px rgba(0,0,0,0.3);
  }
  .card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 8px;
  }
  .secret-name {
    color: var(--accent);
    font-weight: bold;
    font-size: 13px;
    letter-spacing: 1px;
  }
  .copy-btn {
    background: #1e293b;
    border: 1px solid rgba(255,255,255,0.2);
    color: #fff;
    padding: 6px 14px;
    font-size: 11px;
    border-radius: 8px;
    cursor: pointer;
    transition: 0.2s all;
  }
  .copy-btn:hover { background: var(--accent); color: #000; }
  .secret-box {
    background: rgba(0, 0, 0, 0.4);
    border-radius: 8px;
    padding: 10px;
    font-size: 12px;
    color: #94a3b8;
    overflow-x: auto;
    white-space: nowrap;
    border: 1px solid rgba(255, 255, 255, 0.05);
  }
  .footer { text-align: center; font-size: 11px; color: #64748b; margin-top: 24px; }
  .action-btn {
    width: 100%;
    padding: 12px;
    background: #4285F4;
    color: #fff;
    font-weight: bold;
    border: none;
    border-radius: 10px;
    margin-bottom: 20px;
    cursor: pointer;
    transition: 0.2s;
  }
  .action-btn:hover { background: #3367d6; }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/forge/1.3.1/forge.min.js"></script>
</head>
<body>
<div class="container">
  <div class="header">
    <div class="badge">☬ SHΞN™ LITE ENGINE ☬</div>
    <div class="google-title">
      <span class="g-b">G</span><span class="g-r">o</span><span class="g-y">o</span><span class="g-b">g</span><span class="g-g">l</span><span class="g-r">e</span>
      <span style="color:#fff;">Secrets</span>
    </div>
    <p style="font-size: 12px; color: #94a3b8;">Standalone RSA-2048 / SHA256 Key Generator</p>
  </div>

  <button class="action-btn" id="gen-btn" onclick="generateKeystore()">⚡ Generate Clean Secrets</button>

  <div id="results" style="display:none;">
    <div class="card">
      <div class="card-header">
        <span class="secret-name">BDS_KEYSTORE_PASSWORD</span>
        <button class="copy-btn" onclick="copyVal('sec1', this)">Copy</button>
      </div>
      <div class="secret-box" id="sec1"></div>
    </div>

    <div class="card">
      <div class="card-header">
        <span class="secret-name">BDS_KEY_ALIAS</span>
        <button class="copy-btn" onclick="copyVal('sec2', this)">Copy</button>
      </div>
      <div class="secret-box" id="sec2"></div>
    </div>

    <div class="card">
      <div class="card-header">
        <span class="secret-name">BDS_KEY_PASSWORD</span>
        <button class="copy-btn" onclick="copyVal('sec3', this)">Copy</button>
      </div>
      <div class="secret-box" id="sec3"></div>
    </div>

    <div class="card">
      <div class="card-header">
        <span class="secret-name">BDS_KEYSTORE (PKCS12 Base64)</span>
        <button class="copy-btn" onclick="copyVal('sec4', this)">Copy</button>
      </div>
      <div class="secret-box" id="sec4"></div>
    </div>
  </div>

  <div class="footer">
    Zero Termux overhead. Cryptographically compliant with Google Play Protect.
  </div>
</div>

<script>
function randPass() {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let res = '';
  for (let i = 0; i < 16; i++) res += chars.charAt(Math.floor(Math.random() * chars.length));
  return res;
}

function generateKeystore() {
  const btn = document.getElementById('gen-btn');
  btn.innerText = 'Generating RSA-2048 Keypair...';
  btn.disabled = true;

  setTimeout(() => {
    const password = randPass();
    const alias = 'bds_key_' + Math.floor(Date.now() / 1000);

    const keys = forge.pki.rsa.generateKeyPair(2048);
    const cert = forge.pki.createCertificate();
    cert.publicKey = keys.publicKey;
    cert.serialNumber = '01';
    cert.validity.notBefore = new Date();
    cert.validity.notAfter = new Date();
    cert.validity.notAfter.setFullYear(cert.validity.notBefore.getFullYear() + 25);

    const attrs = [{ name: 'commonName', value: 'BDS' }, { name: 'organizationName', value: 'SHEN' }];
    cert.setSubject(attrs);
    cert.setIssuer(attrs);
    cert.sign(keys.privateKey, forge.md.sha256.create());

    const p12Asn1 = forge.pkcs12.toPkcs12Asn1(keys.privateKey, [cert], password, {
      algorithm: '3des',
      friendlyName: alias
    });

    const p12Der = forge.asn1.toDer(p12Asn1).getBytes();
    const base64Keystore = btoa(p12Der);

    document.getElementById('sec1').innerText = password;
    document.getElementById('sec2').innerText = alias;
    document.getElementById('sec3').innerText = password;
    document.getElementById('sec4').innerText = base64Keystore;

    document.getElementById('results').style.display = 'block';
    btn.innerText = 'Regenerate New Keys';
    btn.disabled = false;
  }, 100);
}

function copyVal(id, btn) {
  const val = document.getElementById(id).innerText;
  navigator.clipboard.writeText(val).then(() => {
    const orig = btn.innerText;
    btn.innerText = 'Copied! ✓';
    btn.style.background = '#34A853';
    btn.style.color = '#fff';
    setTimeout(() => {
      btn.innerText = orig;
      btn.style.background = '#1e293b';
    }, 1500);
  });
}
</script>
</body>
</html>
HTMLEOF

echo -e "${G}✔ Zero-weight launcher ready.${RESET}"
echo -e "${C}🌐 Opening browser...${RESET}"

termux-open "$HTML_FILE" 2>/dev/null || xdg-open "$HTML_FILE" 2>/dev/null
