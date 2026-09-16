#!/data/data/com.termux/files/usr/bin/bash

# --- ANSI TrueColor ---
B='\033[38;2;66;133;244m'
R='\033[38;2;234;67;53m'
Y='\033[38;2;251;188;5m'
G='\033[38;2;52;168;83m'
C='\033[38;2;0;240;255m'
W='\033[38;2;255;255;255m'
DIM='\033[2m'
RESET='\033[0m'
BOLD='\033[1m'

clear

# Compact Pixel-Art Google Logo
echo -e "${B} █▀▀ ${R}█▀█ ${Y}█▀█ ${B}█▀▀ ${G}█   ${R}█▀▀${RESET}"
echo -e "${B} █ █ ${R}█ █ ${Y}█ █ ${B}█ █ ${G}█   ${R}██▀${RESET}"
echo -e "${B} ▀▀▀ ${R}▀▀▀ ${Y}▀▀▀ ${B}▀▀▀ ${G}▀▀▀ ${R}▀▀▀${RESET}"
echo -e "${C}${BOLD}   ☬ SHΞN™ SECURE KEY VAULT ☬${RESET}"
echo -e "${DIM}──────────────────────────────────────────${RESET}"

# Package check with live output
REQUIRED_PKGS=("openjdk-17" "coreutils" "termux-tools")
MISSING_PKGS=()

for pkg in "${REQUIRED_PKGS[@]}"; do
    if ! dpkg -s "$pkg" >/dev/null 2>&1; then
        MISSING_PKGS+=("$pkg")
    fi
done

if [ ${#MISSING_PKGS[@]} -gt 0 ]; then
    echo -e "${Y}⚙ Installing required packages: ${MISSING_PKGS[*]}${RESET}"
    echo -e "${DIM}Updating repositories...${RESET}"
    pkg update -y
    echo -e "${DIM}Installing dependencies...${RESET}"
    pkg install -y "${MISSING_PKGS[@]}"
    echo -e "${G}✔ Dependencies installed successfully.${RESET}"
    echo -e "${DIM}──────────────────────────────────────────${RESET}"
else
    echo -e "${G}✔ All dependencies verified.${RESET}"
fi

# Generating Keystore
echo -e "${B}⚡ Generating Android Key (RSA 2048 / SHA256)...${RESET}"

OUTPUT_KEY="release.jks"
ALIAS_NAME="bds_key_$(date +%s)"
STORE_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16)
KEY_PASS=$STORE_PASS

keytool -genkeypair -v \
  -keystore "$OUTPUT_KEY" \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000 \
  -alias "$ALIAS_NAME" \
  -sigalg SHA256withRSA \
  -storepass "$STORE_PASS" \
  -keypass "$KEY_PASS" \
  -dname "CN=BDS, OU=Mobile, O=SHEN, L=Chalus, ST=Mazandaran, C=US" \
  -noprompt >/dev/null 2>&1

BASE64_KEY=$(base64 -w 0 "$OUTPUT_KEY")
HTML_FILE="bds_secrets.html"

# Generate Glassmorphism UI
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
</style>
</head>
<body>
<div class="container">
  <div class="header">
    <div class="badge">☬ SHΞN™ KEY SYSTEM ☬</div>
    <div class="google-title">
      <span class="g-b">G</span><span class="g-r">o</span><span class="g-y">o</span><span class="g-b">g</span><span class="g-g">l</span><span class="g-r">e</span>
      <span style="color:#fff;">Secrets</span>
    </div>
    <p style="font-size: 12px; color: #94a3b8;">Copy values into your GitHub Repository Secrets</p>
  </div>

  <div class="card">
    <div class="card-header">
      <span class="secret-name">BDS_KEYSTORE_PASSWORD</span>
      <button class="copy-btn" onclick="copyVal('sec1', this)">Copy</button>
    </div>
    <div class="secret-box" id="sec1">__STORE_PASS__</div>
  </div>

  <div class="card">
    <div class="card-header">
      <span class="secret-name">BDS_KEY_ALIAS</span>
      <button class="copy-btn" onclick="copyVal('sec2', this)">Copy</button>
    </div>
    <div class="secret-box" id="sec2">__ALIAS_NAME__</div>
  </div>

  <div class="card">
    <div class="card-header">
      <span class="secret-name">BDS_KEY_PASSWORD</span>
      <button class="copy-btn" onclick="copyVal('sec3', this)">Copy</button>
    </div>
    <div class="secret-box" id="sec3">__KEY_PASS__</div>
  </div>

  <div class="card">
    <div class="card-header">
      <span class="secret-name">BDS_KEYSTORE</span>
      <button class="copy-btn" onclick="copyVal('sec4', this)">Copy</button>
    </div>
    <div class="secret-box" id="sec4">__BASE64_KEY__</div>
  </div>

  <div class="footer">
    Key saved locally as <code style="color:var(--accent)">release.jks</code>
  </div>
</div>

<script>
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

sed -i "s/__STORE_PASS__/$STORE_PASS/g" "$HTML_FILE"
sed -i "s/__ALIAS_NAME__/$ALIAS_NAME/g" "$HTML_FILE"
sed -i "s/__KEY_PASS__/$KEY_PASS/g" "$HTML_FILE"
sed -i "s|__BASE64_KEY__|$BASE64_KEY|g" "$HTML_FILE"

echo -e "${G}✔ Keystore created & UI ready.${RESET}"
echo -e "${C}🌐 Opening browser...${RESET}"

termux-open "$HTML_FILE" 2>/dev/null || xdg-open "$HTML_FILE" 2>/dev/null
