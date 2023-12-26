FROM ubuntu
RUN apt update && \
  DEBIAN_FRONTEND=noninteractive apt install qemu-kvm *zenhei* xz-utils dbus-x11 curl firefox gnome-system-monitor mate-system-monitor git xfce4 xfce4-terminal tightvncserver wget -y
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz &&
  curl -LO https://proot.gitlab.io/proot/bin/proot && \
  chmod 755 proot && \
  mv proot /bin && \
  tar -xvf v1.2.0.tar.gz && \
  mkdir $HOME/.vnc && \
  echo 'luo' | vncpasswd -f > $HOME/.vnc/passwd && \
  chmod 600 $HOME/.vnc/passwd && \
  echo 'whoami ' >>/luo.sh && \
  echo 'cd ' >>/luo.sh && \
  echo "su -l -c  'vncserver :2000 -geometry 1280x800' "  >>/luo.sh && \
  echo 'cd /noVNC-1.2.0' >>/luo.sh && \
  echo './utils/launch.sh  --vnc localhost:7900 --listen 8900 ' >>/luo.sh && \
  chmod 755 /luo.sh
EXPOSE 8900 2322
CMD  /luo.sh
