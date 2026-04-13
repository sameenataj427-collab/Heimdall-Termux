#!/data/data/com.termux/files/usr/bin/sh

echo "[*] Fixing broken packages and updating..."
# This clears the libxml2 error you see in the screenshot
apt --fix-broken install -y
pkg update -y && pkg upgrade -y

echo "[*] Installing necessary dependencies..."
pkg install -y libusb termux-api binutils libxml2

echo "[*] Moving Heimdall files to $PREFIX/bin..."

# 1. Move the wrapper script
if [ -f "./heimdall" ]; then
    mv ./heimdall $PREFIX/bin/
    chmod +x $PREFIX/bin/heimdall
    echo "[+] Moved heimdall wrapper to $PREFIX/bin/"
else
    echo "[!] Error: heimdall wrapper not found!"
fi

# 2. Move the engine binary
if [ -f "./heimdall-binary" ]; then
    mv ./heimdall-binary $PREFIX/bin/
    chmod +x $PREFIX/bin/heimdall-binary
    echo "[+] Moved heimdall-binary to $PREFIX/bin/"
else
    echo "[!] Error: heimdall-binary not found!"
fi

echo "=========================================="
echo "✅ Setup Complete!"
echo "=========================================="
