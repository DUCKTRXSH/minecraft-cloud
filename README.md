# 🖥️ Minecraft Java บน GitHub Codespace ผ่านเบราว์เซอร์

เล่น Minecraft Java (ผ่าน TLauncher) บน Codespace ด้วยการจำลอง Desktop + VNC + noVNC

## ✅ วิธีใช้งาน (Clone แล้วรัน)

1. เปิด GitHub Codespace ของตัวเอง
2. เปิด Terminal แล้วรันคำสั่ง:
   ```bash
   git clone https://github.com/<your-username>/minecraft-cloud.git
   cd minecraft-cloud
   docker build -t mc .
   docker run -p 6080:6080 mc


   # เจอปัญหาแก้เองละกันจุ๊บๆ
