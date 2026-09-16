#!/data/data/com.termux/files/usr/bin/bash

# --- Colors ---
B='\033[38;2;66;133;244m'
R='\033[38;2;234;67;53m'
Y='\033[38;2;251;188;5m'
G='\033[38;2;52;168;83m'
C='\033[38;2;0;240;255m'
RESET='\033[0m'
BOLD='\033[1m'

clear
echo -e "${B} █▀▀ ${R}█▀█ ${Y}█▀█ ${B}█▀▀ ${G}█   ${R}█▀▀${RESET}"
echo -e "${B} █ █ ${R}█ █ ${Y}█ █ ${B}█ █ ${G}█   ${R}█▀${RESET}"
echo -e "${B} ▀▀▀ ${R}▀▀▀ ${Y}▀▀▀ ${B}▀▀▀ ${G}▀▀▀ ${R}▀▀▀${RESET}"
echo -e "${C}${BOLD}   ☬ SHΞN™ SECURE KEY CRACK ☬${RESET}"
echo "──────────────────────────────────────────"

# اضافه کردن مینی‌سرور 40 کیلوبایتی (darkhttpd) برای دور زدن محدودیت مرورگر
if ! command -v openssl &> /dev/null || ! command -v darkhttpd &> /dev/null; then
    echo -e "${Y}☬ Installing ®️SHΞN™apk tools (OpenSSL + Micro Server)...${RESET}"
    pkg update -y > /dev/null 2>&1
    pkg install -y openssl termux-tools darkhttpd > /dev/null 2>&1 &
    pid=$!
    spin='-\|/'
    i=0
    while kill -0 $pid 2>/dev/null; do
        i=$(( (i+1) %4 ))
        printf "\r${C}[${spin:$i:1}] Preparing environment...${RESET}"
        sleep 0.1
    done
    printf "\r${G}[✔] Environment Ready!                 ${RESET}\n"
fi

echo -e "${B} 📦 Generating Android Key...${RESET}"

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

# صفحه HTML - بهبود یافته
cat << 'HTMLEOF' > "$HTML_FILE"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BDS Secure Assets</title>
<style>
  body { background: #0b1121; color: #f8fafc; font-family: 'Segoe UI', system-ui, sans-serif; padding: 20px; margin: 0; display: flex; flex-direction: column; align-items: center;}
  .container { width: 100%; max-width: 650px; }
  
  /* Header Styles */
  .header-container { text-align: center; margin-bottom: 40px; margin-top: 20px;}
  .header { font-size: 54px; font-weight: 800; letter-spacing: -2px; margin-bottom: 0; line-height: 1;}
  .subtitle { font-size: 13px; color: #94a3b8; font-weight: 500; letter-spacing: 3px; text-transform: uppercase; margin-top: 8px;}
  .g-b { color: #4285F4; } .g-r { color: #EA4335; } .g-y { color: #FBBC05; } .g-g { color: #34A853; }
  
  /* Cards */
  .card { background: rgba(30, 41, 59, 0.7); border: 1px solid rgba(255,255,255,0.08); border-radius: 14px; padding: 20px; margin-bottom: 16px; box-shadow: 0 10px 25px rgba(0,0,0,0.4); backdrop-filter: blur(10px);}
  .card-top { display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px; }
  .name { color: #38bdf8; font-weight: 700; font-size: 15px; letter-spacing: 0.5px;}
  .btn { background: #0f172a; border: 1px solid #334155; color: #e2e8f0; padding: 6px 14px; border-radius: 6px; cursor: pointer; transition: all 0.2s; font-size: 12px; font-weight: bold;}
  .btn:hover { background: #38bdf8; color: #0f172a; border-color: #38bdf8;}
  .box { background: rgba(0,0,0,0.6); padding: 14px; border-radius: 8px; color: #cbd5e1; font-size: 13px; font-family: 'Courier New', Courier, monospace; overflow-x: auto; white-space: nowrap; border: 1px inset rgba(255,255,255,0.05);}
  
  /* Action Buttons Group */
  .actions-container { display: flex; flex-wrap: wrap; gap: 12px; margin-top: 30px; justify-content: center; padding-bottom: 40px;}
  .btn-action { display: flex; align-items: center; gap: 8px; padding: 12px 20px; border-radius: 10px; border: none; font-weight: 600; font-size: 14px; cursor: pointer; transition: transform 0.2s, box-shadow 0.2s; color: white; text-decoration: none;}
  .btn-action:hover { transform: translateY(-3px); box-shadow: 0 8px 15px rgba(0,0,0,0.3);}
  .btn-action svg { width: 18px; height: 18px; fill: currentColor;}
  
  .btn-json { background: linear-gradient(135deg, #f59e0b, #d97706); }
  .btn-prompt { background: linear-gradient(135deg, #8b5cf6, #6d28d9); }
  .btn-gpt { background: linear-gradient(135deg, #10a37f, #059669); }
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
    <div class="card-top"><span class="name">KEYSTORE_PASSWORD</span><button class="btn" onclick="copyVal('s1', this)">Copy</button></div>
    <div class="box" id="s1">__STORE_PASS__</div>
  </div>
  <div class="card">
    <div class="card-top"><span class="name">KEY_ALIAS</span><button class="btn" onclick="copyVal('s2', this)">Copy</button></div>
    <div class="box" id="s2">__ALIAS_NAME__</div>
  </div>
  <div class="card">
    <div class="card-top"><span class="name">KEY_PASSWORD</span><button class="btn" onclick="copyVal('s3', this)">Copy</button></div>
    <div class="box" id="s3">__STORE_PASS__</div>
  </div>
  <div class="card">
    <div class="card-top"><span class="name">KEYSTORE (Base64)</span><button class="btn" onclick="copyVal('s4', this)">Copy</button></div>
    <div class="box" id="s4">__BASE64_KEY__</div>
  </div>

  <div class="actions-container">
    <button class="btn-action btn-json" onclick="downloadJSON()">
      <svg viewBox="0 0 24 24"><path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"/></svg>
      Download JSON
    </button>
    
    <button class="btn-action btn-prompt" id="promptBtn" onclick="copyAIPrompt(this)">
      <svg viewBox="0 0 24 24"><path d="M16 1H4c-1.1 0-2 .9-2 2v14h2V3h12V1zm3 4H8c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h11c1.1 0 2-.9 2-2V7c0-1.1-.9-2-2-2zm0 16H8V7h11v14z"/></svg>
      Copy AI Prompt
    </button>

    <a href="https://chatgpt.com/" target="_blank" class="btn-action btn-gpt">
      <svg viewBox="0 0 24 24"><path d="M20.5 10.5l-2.5-1.5-2.5 1.5v3l2.5 1.5 2.5-1.5v-3zM10.5 5.5l-2.5-1.5-2.5 1.5v3l2.5 1.5 2.5-1.5v-3zM15.5 14.5l-2.5-1.5-2.5 1.5v3l2.5 1.5 2.5-1.5v-3z"/></svg>
      Open ChatGPT
    </a>
  </div>

</div>

<script>
const appSecrets = {
  "KEYSTORE_PASSWORD": "__STORE_PASS__",
  "KEY_ALIAS": "__ALIAS_NAME__",
  "KEY_PASSWORD": "__STORE_PASS__",
  "KEYSTORE_BASE64": "__BASE64_KEY__"
};

function copyVal(id, btn) {
  navigator.clipboard.writeText(document.getElementById(id).innerText).then(() => {
    let old = btn.innerText; 
    btn.innerText = 'Copied ✓'; 
    btn.style.background = '#34A853'; 
    btn.style.color = '#fff';
    setTimeout(() => { 
      btn.innerText = old; 
      btn.style.background = '#0f172a'; 
    }, 1500);
  });
}

function downloadJSON() {
  const dataStr = "data:text/json;charset=utf-8," + encodeURIComponent(JSON.stringify(appSecrets, null, 2));
  const downloadAnchorNode = document.createElement('a');
  downloadAnchorNode.setAttribute("href",     dataStr);
  downloadAnchorNode.setAttribute("download", "bds_android_keys.json");
  document.body.appendChild(downloadAnchorNode);
  downloadAnchorNode.click();
  downloadAnchorNode.remove();
}

function copyAIPrompt(btn) {
  const promptText = `I have generated my Android Keystore parameters. I need to sign my Android application using these credentials. 
Please provide the exact Gradle configuration (build.gradle/kts) or GitHub Actions workflow to inject these values properly:

- KEYSTORE_PASSWORD: ${appSecrets.KEYSTORE_PASSWORD}
- KEY_ALIAS: ${appSecrets.KEY_ALIAS}
- KEY_PASSWORD: ${appSecrets.KEY_PASSWORD}
- KEYSTORE_BASE64: [base64_string_is_ready_but_too_long_to_paste_here]

How should I securely decode the base64 keystore and apply these variables in my build pipeline?`;

  navigator.clipboard.writeText(promptText).then(() => {
    let originalHtml = btn.innerHTML;
    btn.innerHTML = `<svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg> Prompt Copied!`;
    setTimeout(() => { btn.innerHTML = originalHtml; }, 2000);
  });
}
</script>
</body>
</html>
HTMLEOF

sed -i "s/__STORE_PASS__/$STORE_PASS/g" "$HTML_FILE"
sed -i "s/__ALIAS_NAME__/$ALIAS_NAME/g" "$HTML_FILE"
sed -i "s|__BASE64_KEY__|$BASE64_KEY|g" "$HTML_FILE"

# اجرای مینی‌سرور لوکال هاست برای دور زدن محدودیت اندروید
pkill -f "darkhttpd" 2>/dev/null
PORT=$((8000 + RANDOM % 1000))
darkhttpd . --port $PORT >/dev/null 2>&1 &

echo -e "${G}✔ Success! Launching securely on localhost...${RESET}"
sleep 1

# باز کردن آدرس سرور به جای آدرس فایل
termux-open "http://127.0.0.1:$PORT/$HTML_FILE" 2>/dev/null
