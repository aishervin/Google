#!/data/data/com.termux/files/usr/bin/bash

# --- Colors ---
B='\033[38;2;66;133;244m'
R='\033[38;2;234;67;53m'
Y='\033[38;2;251;188;5m'
G='\033[38;2;52;168;83m'
C='\033[38;2;0;240;255m'
W='\033[38;2;255;255;255m'
RESET='\033[0m'
BOLD='\033[1m'

clear
echo -e "${B} █▀▀ ${R}█▀█ ${Y}█▀█ ${B}█▀▀ ${G}█   ${R}█▀▀${RESET}"
echo -e "${B} █ █ ${R}█ █ ${Y}█ █ ${B}█ █ ${G}█   ${R}█▀${RESET}"
echo -e "${B} ▀▀▀ ${R}▀▀▀ ${Y}▀▀▀ ${B}▀▀▀ ${G}▀▀▀ ${R}▀▀▀${RESET}"
echo -e "${C}${BOLD}   ☬ SHΞN™ SECURE KEY CRACK ☬${RESET}"
echo -e "${W}──────────────────────────────────────────${RESET}"

# Professional Loading Animation for Dependencies
if ! command -v openssl &> /dev/null || ! command -v darkhttpd &> /dev/null; then
    echo -e "${Y}>> Initializing System Protocol...${RESET}"
    pkg update -y > /dev/null 2>&1
    pkg install -y openssl termux-tools darkhttpd > /dev/null 2>&1 &
    pid=$!
    
    width=20
    while kill -0 $pid 2>/dev/null; do
        for ((i=0; i<=width; i++)); do
            printf "\r${C}[${RESET}"
            for ((j=0; j<i; j++)); do printf "${B}■${RESET}"; done
            for ((j=i; j<width; j++)); do printf " "; done
            printf "${C}] Securing environment...${RESET}"
            sleep 0.05
        done
        for ((i=width; i>=0; i--)); do
            printf "\r${C}[${RESET}"
            for ((j=0; j<i; j++)); do printf "${B}■${RESET}"; done
            for ((j=i; j<width; j++)); do printf " "; done
            printf "${C}] Securing environment...${RESET}"
            sleep 0.05
        done
    done
    printf "\r${G}[■■■■■■■■■■■■■■■■■■■■] Core Modules Active!         ${RESET}\n"
fi

echo -e "${W}>> Generating Cryptographic Assets...${RESET}"

STORE_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16)
ALIAS_NAME="bds_key_$(date +%s)"

openssl req -x509 -newkey rsa:2048 -nodes -days 10000 \
  -keyout key.pem -out cert.pem \
  -subj "/CN=BDS/OU=Mobile/O=SHEN/C=US" 2>/dev/null

openssl pkcs12 -export -out release.p12 \
  -inkey key.pem -in cert.pem \
  -name "$ALIAS_NAME" \
  -password "pass:$STORE_PASS" 2>/dev/null

rm -f key.pem cert.pem
BASE64_KEY=$(base64 -w 0 release.p12)
HTML_FILE="bds_secrets.html"

# Generating HTML Template
cat << 'HTMLEOF' > "$HTML_FILE"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BDS Secure Assets</title>
<style>
  body { background: #07090e; color: #f1f5f9; font-family: 'Inter', -apple-system, sans-serif; padding: 25px 20px; margin: 0; display: flex; flex-direction: column; align-items: center; min-height: 100vh;}
  .container { width: 100%; max-width: 650px; flex: 1; }
  
  .header-container { text-align: center; margin-bottom: 45px; margin-top: 15px;}
  .header { font-size: 50px; font-weight: 800; letter-spacing: -2px; margin-bottom: 0; line-height: 1;}
  .subtitle { font-size: 11px; color: #64748b; font-weight: 600; letter-spacing: 4px; text-transform: uppercase; margin-top: 10px;}
  .g-b { color: #4285F4; } .g-r { color: #EA4335; } .g-y { color: #FBBC05; } .g-g { color: #34A853; }
  
  .card { background: #111520; border: 1px solid #1e2436; border-radius: 12px; padding: 18px; margin-bottom: 14px; box-shadow: 0 4px 20px rgba(0,0,0,0.5);}
  .card-top { display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px; }
  .name { color: #8fa0b5; font-weight: 600; font-size: 13px; letter-spacing: 0.5px;}
  
  .btn-sm { background: #1e2436; border: 1px solid #2a334a; color: #cbd5e1; padding: 5px 12px; border-radius: 6px; cursor: pointer; transition: all 0.2s; font-size: 11px; font-weight: bold;}
  .btn-sm:hover { background: #cbd5e1; color: #07090e; }
  
  .box { background: #0a0d14; padding: 12px; border-radius: 6px; color: #38bdf8; font-size: 13px; font-family: 'SFMono-Regular', monospace; overflow-x: auto; white-space: nowrap; border: 1px solid #171c2a;}
  
  .actions-container { display: flex; flex-direction: row; gap: 15px; margin-top: 35px; justify-content: center; }
  .btn-action { display: flex; align-items: center; gap: 8px; padding: 12px 16px; border-radius: 8px; border: 1px solid #2a334a; font-weight: 500; font-size: 13px; cursor: pointer; transition: all 0.2s; color: #e2e8f0; text-decoration: none; background: #111520;}
  .btn-action:hover { background: #1e2436; border-color: #475569; transform: translateY(-2px);}
  .btn-action svg { width: 16px; height: 16px; fill: currentColor;}
  
  .footer { margin-top: 50px; text-align: center; font-size: 12px; color: #475569; font-weight: 600; letter-spacing: 1px; padding-bottom: 20px;}
</style>
</head>
<body>
<div class="container">
  
  <div class="header-container">
    <div class="header">
      <span class="g-b">G</span><span class="g-r">o</span><span class="g-y">o</span><span class="g-b">g</span><span class="g-g">l</span><span class="g-r">e</span>
    </div>
    <div class="subtitle">Secret key asset</div>
  </div>

  <div class="card">
    <div class="card-top"><span class="name">KEYSTORE_PASSWORD</span><button class="btn-sm" onclick="copyVal('s1', this)">COPY</button></div>
    <div class="box" id="s1">__STORE_PASS__</div>
  </div>
  <div class="card">
    <div class="card-top"><span class="name">KEY_ALIAS</span><button class="btn-sm" onclick="copyVal('s2', this)">COPY</button></div>
    <div class="box" id="s2">__ALIAS_NAME__</div>
  </div>
  <div class="card">
    <div class="card-top"><span class="name">KEY_PASSWORD</span><button class="btn-sm" onclick="copyVal('s3', this)">COPY</button></div>
    <div class="box" id="s3">__STORE_PASS__</div>
  </div>
  <div class="card">
    <div class="card-top"><span class="name">KEYSTORE (Base64)</span><button class="btn-sm" onclick="copyVal('s4', this)">COPY</button></div>
    <div class="box" id="s4">__BASE64_KEY__</div>
  </div>

  <div class="actions-container">
    <button class="btn-action" onclick="downloadJSON()">
      <svg viewBox="0 0 24 24"><path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"/></svg>
      JSON
    </button>
    
    <button class="btn-action" id="promptBtn" onclick="copyAIPrompt(this)">
      <svg viewBox="0 0 24 24"><path d="M16 1H4c-1.1 0-2 .9-2 2v14h2V3h12V1zm3 4H8c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h11c1.1 0 2-.9 2-2V7c0-1.1-.9-2-2-2zm0 16H8V7h11v14z"/></svg>
      Prompt
    </button>

    <button class="btn-action" onclick="openChatGPT()">
      <svg viewBox="0 0 24 24"><path d="M22.28 9.82a6 6 0 0 0-.51-4.91 6.05 6.05 0 0 0-6.51-2.9A6.07 6.07 0 0 0 4.98 4.18a6 6 0 0 0-4 2.9 6.05 6.05 0 0 0 .74 7.1 6 6 0 0 0 .51 4.91 6.05 6.05 0 0 0 6.51 2.9 6 6 0 0 0 4.51-2.17 6.06 6.06 0 0 0 5.77-4.21 6 6 0 0 0 4-2.9 6.06 6.06 0 0 0-.74-7.08zm-9.02 12.68c-1.23 0-2.36-.5-3.27-1.34.14-.09.36-.21.51-.3l5.23-3.02a.86.86 0 0 0 .43-.74V9.79l1.65 1.11c.02.01.03.04.03.06v6.04c0 3.03-2.47 5.5-5.5 5.5zM5.13 18.06A4.55 4.55 0 0 1 3.53 14.5c0-1.23.5-2.36 1.34-3.27.09.15.21.36.3.51l5.23 3.02a.86.86 0 0 0 .86 0l6.32-3.65-.82 1.43a.07.07 0 0 1-.05.03l-5.23 3.02c-2.63 1.52-5.96.62-7.48-2.01zM2.87 7.16c.84-1.34 2.22-2.2 3.78-2.38-.05.16-.12.38-.18.55l-2.61 5.38a.86.86 0 0 0-.02.86l3.16 5.47-1.64-1.11a.07.07 0 0 1-.03-.06V9.84c0-2.63 1.52-5.96 4.14-7.48zM19.35 7.42l-5.23-3.02a.86.86 0 0 0-.86 0l-6.32 3.65.82-1.43a.07.07 0 0 1 .05-.03l5.23-3.02c2.63-1.52 5.96-.62 7.48 2.01.84 1.34 1.26 2.88 1.26 4.45 0 1.23-.5 2.36-1.34 3.27-.09-.14-.21-.35-.3-.5zM20.25 16.31c-.84 1.34-2.22 2.2-3.78 2.38.05-.16.12-.38.18-.55l2.61-5.38a.86.86 0 0 0 .02-.86l-3.16-5.47 1.64 1.11c.02.01.03.04.03.06v6.05c0 2.63-1.52 5.96-4.14 7.48zM8.35 5.94c1.23 0 2.36.5 3.27 1.34-.14.09-.36.21-.51.3L5.88 10.61a.86.86 0 0 0-.43.74V18.65l-1.65-1.11a.07.07 0 0 1-.03-.06V11.44c0-3.03 2.47-5.5 5.5-5.5z"/></svg>
      Ask GPT
    </button>
  </div>
</div>

<div class="footer">☬Exclusive SHΞN™ made</div>

<script>
const appSecrets = {
  "KEYSTORE_PASSWORD": "__STORE_PASS__",
  "KEY_ALIAS": "__ALIAS_NAME__",
  "KEY_PASSWORD": "__STORE_PASS__",
  "KEYSTORE_BASE64": "__BASE64_KEY__"
};

const aiPromptText = `I have generated my Android Keystore parameters. I need to sign my Android application using these credentials. Please provide the exact Gradle configuration (build.gradle/kts) or GitHub Actions workflow to inject these values properly:

KEYSTORE_PASSWORD: ${appSecrets.KEYSTORE_PASSWORD}
KEY_ALIAS: ${appSecrets.KEY_ALIAS}
KEY_PASSWORD: ${appSecrets.KEY_PASSWORD}
KEYSTORE_BASE64: [Attached Base64 String]

How should I securely decode the base64 keystore and apply these variables in my build pipeline?`;

function copyVal(id, btn) {
  navigator.clipboard.writeText(document.getElementById(id).innerText).then(() => {
    let old = btn.innerText; 
    btn.innerText = 'COPIED'; 
    btn.style.color = '#34A853';
    setTimeout(() => { 
      btn.innerText = old; 
      btn.style.color = '#cbd5e1'; 
    }, 1500);
  });
}

function downloadJSON() {
  const dataStr = "data:text/json;charset=utf-8," + encodeURIComponent(JSON.stringify(appSecrets, null, 2));
  const link = document.createElement('a');
  link.setAttribute("href", dataStr);
  link.setAttribute("download", "bds_android_keys.json");
  document.body.appendChild(link);
  link.click();
  link.remove();
}

function copyAIPrompt(btn) {
  navigator.clipboard.writeText(aiPromptText).then(() => {
    let originalHtml = btn.innerHTML;
    btn.innerHTML = `<svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg> Copied`;
    setTimeout(() => { btn.innerHTML = originalHtml; }, 2000);
  });
}

function openChatGPT() {
  const gptUrl = "https://chatgpt.com/?q=" + encodeURIComponent(aiPromptText);
  window.open(gptUrl, '_blank');
}
</script>
</body>
</html>
HTMLEOF

sed -i "s/__STORE_PASS__/$STORE_PASS/g" "$HTML_FILE"
sed -i "s/__ALIAS_NAME__/$ALIAS_NAME/g" "$HTML_FILE"
sed -i "s|__BASE64_KEY__|$BASE64_KEY|g" "$HTML_FILE"

# Start Micro-server
pkill -f "darkhttpd" 2>/dev/null
PORT=$((8000 + RANDOM % 1000))
darkhttpd . --port $PORT >/dev/null 2>&1 &

echo -e "${G}>> Secure Instance Running on Localhost!${RESET}"
sleep 1

# Launch Browser
termux-open "http://127.0.0.1:$PORT/$HTML_FILE" 2>/dev/null
