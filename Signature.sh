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
echo -e "${B} █ █ ${R}█ █ ${Y}█ █ ${B}█ █ ${G}█   ${R}██▀${RESET}"
echo -e "${B} ▀▀▀ ${R}▀▀▀ ${Y}▀▀▀ ${B}▀▀▀ ${G}▀▀▀ ${R}▀▀▀${RESET}"
echo -e "${C}${BOLD}   ☬ SHΞN™ SECURE KEY VAULT ☬${RESET}"
echo "──────────────────────────────────────────"

# اضافه کردن مینی‌سرور 40 کیلوبایتی (darkhttpd) برای دور زدن محدودیت مرورگر
if ! command -v openssl &> /dev/null || ! command -v darkhttpd &> /dev/null; then
    echo -e "${Y}⚙ Installing minimal tools (OpenSSL + Micro Server)...${RESET}"
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
    printf "\r${G}[✔] Environment ready!                 ${RESET}\n"
fi

echo -e "${B}⚡ Generating Android Key...${RESET}"

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

# صفحه HTML
cat << 'HTMLEOF' > "$HTML_FILE"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BDS Secrets</title>
<style>
  body { background: #090d16; color: #e2e8f0; font-family: system-ui, sans-serif; padding: 20px; margin: 0;}
  .container { max-width: 600px; margin: 0 auto; }
  .header { text-align: center; font-size: 28px; font-weight: bold; margin-bottom: 24px; letter-spacing: 2px;}
  .g-b { color: #4285F4; } .g-r { color: #EA4335; } .g-y { color: #FBBC05; } .g-g { color: #34A853; }
  .card { background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1); border-radius: 12px; padding: 16px; margin-bottom: 16px; box-shadow: 0 4px 15px rgba(0,0,0,0.3);}
  .card-top { display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px; }
  .name { color: #00f0ff; font-weight: bold; font-size: 14px; }
  .btn { background: #1e293b; border: 1px solid #334155; color: #fff; padding: 6px 16px; border-radius: 8px; cursor: pointer; transition: 0.2s;}
  .btn:hover { background: #00f0ff; color: #000; }
  .box { background: rgba(0,0,0,0.5); padding: 12px; border-radius: 8px; color: #94a3b8; font-size: 13px; font-family: monospace; overflow-x: auto; white-space: nowrap; border: 1px solid rgba(255,255,255,0.05);}
</style>
</head>
<body>
<div class="container">
  <div class="header">
    <span class="g-b">G</span><span class="g-r">o</span><span class="g-y">o</span><span class="g-b">g</span><span class="g-g">l</span><span class="g-r">e</span> Secrets
  </div>
  <div class="card">
    <div class="card-top"><span class="name">BDS_KEYSTORE_PASSWORD</span><button class="btn" onclick="copyVal('s1', this)">Copy</button></div>
    <div class="box" id="s1">__STORE_PASS__</div>
  </div>
  <div class="card">
    <div class="card-top"><span class="name">BDS_KEY_ALIAS</span><button class="btn" onclick="copyVal('s2', this)">Copy</button></div>
    <div class="box" id="s2">__ALIAS_NAME__</div>
  </div>
  <div class="card">
    <div class="card-top"><span class="name">BDS_KEY_PASSWORD</span><button class="btn" onclick="copyVal('s3', this)">Copy</button></div>
    <div class="box" id="s3">__STORE_PASS__</div>
  </div>
  <div class="card">
    <div class="card-top"><span class="name">BDS_KEYSTORE (Base64)</span><button class="btn" onclick="copyVal('s4', this)">Copy</button></div>
    <div class="box" id="s4">__BASE64_KEY__</div>
  </div>
</div>
<script>
function copyVal(id, btn) {
  navigator.clipboard.writeText(document.getElementById(id).innerText).then(() => {
    let old = btn.innerText; btn.innerText = 'Copied ✓'; btn.style.background = '#34A853'; btn.style.color = '#fff';
    setTimeout(() => { btn.innerText = old; btn.style.background = '#1e293b'; }, 1500);
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
