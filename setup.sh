#!/data/data/com.termux/files/usr/bin/sh

echo "[*] Updating and Upgrading Termux packages..."
pkg update -y && pkg upgrade -y

echo "[*] Installing dependencies (termux-api, libusb, curl)..."
pkg install termux-api libusb curl -y

echo "[*] Downloading patched Heimdall binary..."
curl -L https://github.com -o $PREFIX/bin/heimdall-binary
chmod +x $PREFIX/bin/heimdall-binary

echo "[*] Creating the no-root wrapper script..."
cat << 'EOF' > $PREFIX/bin/heimdall
#!/data/data/com.termux/files/usr/bin/sh

# Bypass USB check for version/help
if [ "$1" = "version" ] || [ "$1" = "help" ] || [ -z "$1" ]; then
    heimdall-binary "$@"
    exit 0
fi

# Locate device via termux-usb
DEV=$(termux-usb -l | grep -o '/dev/bus/usb/[0-9]*/[0-9]*' | head -n 1)

if [ -z "$DEV" ]; then
    echo "[-] No Samsung device found. Check OTG and Download Mode."
    exit 1
fi

echo "[!] Device found: $DEV"
termux-usb -r "$DEV"

echo "[?] Tap 'OK' on the system popup, then press [ENTER] to continue..."
read dummy

# Final execution with FD
termux-usb -e "$DEV" heimdall-binary "$@"
EOF

chmod +x $PREFIX/bin/heimdall

echo "[+] Success! You can now use 'heimdall' without root."
echo "[+] Connect your phone and try: heimdall detect"
