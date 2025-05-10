#!/bin/bash

# เริ่ม xvfb (จำลองหน้าจอ)
Xvfb :0 -screen 0 1024x768x16 &

# เริ่ม Desktop
startxfce4 &

# รอ Desktop พร้อม
sleep 5

# เริ่ม VNC server
x11vnc -display :0 -passwd 1234 -forever -nopw -shared &

# เริ่ม noVNC บนพอร์ต 6080
websockify --web=/usr/share/novnc/ 6080 localhost:5900
