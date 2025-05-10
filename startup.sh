#!/bin/bash

# ตั้งค่าตัวแปร DISPLAY
export DISPLAY=:0

# เริ่ม xvfb (จำลองหน้าจอเสมือน)
Xvfb :0 -screen 0 1280x800x24 &

# รอให้ Xvfb พร้อม
sleep 2

# กำหนด D-Bus (สำหรับ desktop env)
export $(dbus-launch)

# เริ่ม Desktop (XFCE)
startxfce4 &

# รอ Desktop ทำงานให้เสร็จ
sleep 5

# สร้างไฟล์รหัสผ่าน VNC แบบปลอดภัย
mkdir -p ~/.vnc
x11vnc -storepasswd 1234 ~/.vnc/passwd

# เริ่ม VNC server แบบใช้งานได้จริง และปลอดภัย
x11vnc -display :0 -rfbauth ~/.vnc/passwd -forever -shared -noxdamage -repeat -cursor arrow &

# เริ่ม noVNC
websockify --web=/usr/share/novnc/ 6080 localhost:5900
