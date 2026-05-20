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

# 📖 Usage

1. first install the tool using the steps given below

2. then off your target phone completely

3. then take a good quality otg and attach the otg to the host phone

4. then take a data cable and connect the usb A side to the otg connected to the host phone

5. now with the target phone powered off, hold ots booth volume up and volume down buttons at the same time, while holding them commect rge other side of tge cable to the target phone

6. After connecting keep holding the buttons untill you see a light blue warning screen

7. After the warning screen appers, leave booth buttons, and press tge volume up button once

8. now rhe screen will change and you will see a text that says **"Downloading..."**

9. now you are in download mode, and can use the tool

# Guid To Install The Tool 👇👇

First install [Termux a](https://f-droid.org/repo/com.termux_1022.apk)nd [Termux:api](https://f-droid.org/repo/com.termux.api_1002.apk) from Fdroid or GitHub, dont use termux from playstore, that is a outdated version and it doesn't have the nessary pakages for the tool to run

# after downloading termux and termux api, open termux and run these commands in it

# Give termux storage permission
```bash
termux-setup-storage
```
# Install heildall in termux
```bash
curl -LO https://raw.githubusercontent.com/sameenataj427-collab/Heimdall-Termux-NoRoot/main/heimdall \
     -LO https://raw.githubusercontent.com/sameenataj427-collab/Heimdall-Termux-NoRoot/main/heimdall-binary \
     -LO https://raw.githubusercontent.com/sameenataj427-collab/Heimdall-Termux-NoRoot/main/setup.sh && \
     chmod +x heimdall heimdall-binary setup.sh && \
     ./setup.sh && rm setup.sh
```

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
for suggestions ang bug reports please contact on sameenataj427@gmail.com. Thank you
