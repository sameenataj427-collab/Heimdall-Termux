#!/data/data/com.termux/files/usr/bin/sh

echo "[*] Updating and upgrading packages..."
pkg update -y && pkg upgrade -y

echo "[*] Installing necessary dependencies..."
# cmake and build-essential are needed if you ever re-compile
# libusb and termux-api are critical for the USB handshake
pkg install -y git cmake build-essential libusb termux-api clang binutils

echo "[*] Configuring Heimdall binaries..."

# 1. Place the binary engine
if [ -f "./heimdall-binary" ]; then
    cp ./heimdall-binary $PREFIX/bin/
    chmod +x $PREFIX/bin/heimdall-binary
    echo "[+] heimdall-binary installed to $PREFIX/bin/"
else
    echo "[!] Error: heimdall-binary not found in current folder!"
fi

# 2. Create the wrapper script (heimdall)
cat << 'EOF' > $PREFIX/bin/heimdall
#!/data/data/com.termux/files/usr/bin/sh
BINARY="$PREFIX/bin/heimdall-binary"

# 1. Info commands run instantly
if [ -z "$1" ] || [ "$1" = "help" ] || [ "$1" = "--help" ] || [ "$1" = "version" ]; then
    $BINARY "$@"
    exit 0
fi

# 2. Simple Flash Guide
if [ "$1" = "flash" ] && [ -z "$2" ]; then
    echo "=========================================="
    echo "📌 HOW TO FLASH (Simple Guide)"
    echo "=========================================="
    echo "Structure: heimdall flash --PARTITION_NAME file.img"
    echo ""
    echo "Example: heimdall flash --RECOVERY recovery.img"
    echo "Example: heimdall flash --BOOT boot.img --RECOVERY recovery.img"
    echo "------------------------------------------"
    echo "Note: Use 'heimdall help flash' for technical flags like --no-reboot."
    exit 0
fi

# 3. Command Validation
VALID_CMDS="detect|device-info|download-pit|flash|print-pit|close-pc-screen"
if ! echo "$1" | grep -Eq "^($VALID_CMDS)$"; then
    echo "Error: '$1' is unrecognized. Use 'heimdall help' for help."
    exit 1
fi

# 4. USB Handshake
DEV=$(termux-usb -l | grep -o '/dev/bus/usb/[0-9]*/[0-9]*' | head -n 1)
if [ -z "$DEV" ]; then
    echo "[-] No Samsung device found. Check OTG & Download Mode."
    exit 1
fi

termux-usb -r "$DEV"
echo "[?] Tap 'OK' on the system popup, then press [ENTER] to continue..."
read dummy
termux-usb -e "$DEV" $BINARY "$@"
EOF

chmod +x $PREFIX/bin/heimdall
echo "[+] heimdall wrapper installed to $PREFIX/bin/"

echo "=========================================="
echo "✅ Setup Complete!"
echo "Type 'heimdall' to see the help menu."
echo "=========================================="
