#!/data/data/com.termux/files/usr/bin/sh

echo "[*] Updating and upgrading packages..."
pkg update -y && pkg upgrade -y

echo "[*] Installing necessary dependencies..."
pkg install -y libusb termux-api binutils

echo "[*] Moving Heimdall files to $PREFIX/bin..."

# 1. Move the wrapper script
if [ -f "./heimdall" ]; then
    mv ./heimdall $PREFIX/bin/
    chmod +x $PREFIX/bin/heimdall
    echo "[+] Moved heimdall wrapper to $PREFIX/bin/"
else
    echo "[!] Error: heimdall wrapper not found in current folder!"
fi

# 2. Move the engine binary
if [ -f "./heimdall-binary" ]; then
    mv ./heimdall-binary $PREFIX/bin/
    chmod +x $PREFIX/bin/heimdall-binary
    echo "[+] Moved heimdall-binary to $PREFIX/bin/"
else
    echo "[!] Error: heimdall-binary not found in current folder!"
fi

echo "=========================================="
echo "✅ Setup Complete!"
echo "Both files have been moved to your system path."
echo "=========================================="
