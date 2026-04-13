# Heimdall-Termux
> [!CAUTION]
> **WARNING: This tool deals with low-level device partitions. Incorrect usage can permanently HARD BRICK your device. This tool is currently in BETA TESTING. I am not responsible for any damages, data loss, or bricked phones resulting from its use. Proceed at your own risk and with extreme caution. Always backup your boot and vbmeta partitions before making changes.**
> 

🚀 Heimdall-Termux (No-Root)
Flash Samsung firmware directly from Termux without Root access.
This project uses a patched version of Heimdall v2.2.2 and termux-usb logic to bypass Android's USB restrictions.
🌟 Features
No Root Required: Uses Android's native USB File Descriptors.
Automated Setup: Updates your packages and installs dependencies for you.
Smart Handshake: Handles the USB permission popup and execute flow automatically. 

📦 **Installation**

Run this single command in your Termux:
```bash
curl -LO https://raw.githubusercontent.com/sameenataj427-collab/Heimdall-Termux-NoRoot/main/heimdall \
     -LO https://raw.githubusercontent.com/sameenataj427-collab/Heimdall-Termux-NoRoot/main/heimdall-binary \
     -LO https://raw.githubusercontent.com/sameenataj427-collab/Heimdall-Termux-NoRoot/main/setup.sh && \
     chmod +x heimdall heimdall-binary setup.sh && \
     ./setup.sh && rm setup.sh
```
# 📖 Usage
Connect your Samsung phone in Download Mode via OTG.
Type heimdall detect.
Tap OK on the Android permission popup.
Press ENTER in Termux to finish the handshake.

# Command Examples:

since This Is A full Port of heimdall v2.2.2, you can use all standard commands. here is how To structure them:
# detect connection
```bash
heimdall detect
```
# view device info
```bash
heimdall device-info
```
# flash recovery
```bash
heimdall flash --RECOVERY recovery.img
```
# flash full firmware
```bash
heimdall flash --BOOT boot.img --RECOVERY recovery.img --SYSTEM system.img
```
# print pit (text)
```bash
heimdall print-pit
```
# check version
```bash
heimdall version
```
if you find any bugs please report it on sameenataj427@gmail.com. Thank you
