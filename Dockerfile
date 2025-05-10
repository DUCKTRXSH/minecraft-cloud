FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  xfce4 xfce4-goodies \
  x11vnc xvfb \
  wget curl \
  supervisor \
  openjdk-17-jre \
  novnc websockify \
  net-tools unzip \
  firefox \
  && apt clean

# ดาวน์โหลด TLauncher
RUN mkdir -p /tlauncher && \
    wget -O /tlauncher/TLauncher.jar https://tlauncher.org/jar

# ตั้งค่าพื้นที่ Desktop จำลอง
RUN mkdir -p ~/.vnc && \
    x11vnc -storepasswd 1234 ~/.vnc/passwd

# noVNC config
RUN mkdir -p /root/.vnc/web && \
    ln -s /usr/share/novnc/vnc.html /root/.vnc/web/index.html

COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

EXPOSE 6080

CMD ["/startup.sh"]
