# Minecraft in Codespace via noVNC

เล่น Minecraft Java (ผ่าน TLauncher) จาก GitHub Codespace

## วิธีใช้งาน

1. เปิด Codespace
2. รัน Docker:
   ```bash
   docker build -t mc .
   docker run -p 6080:6080 mc

   # เจอปัญหาแก้เองละกันจุ๊บๆ
