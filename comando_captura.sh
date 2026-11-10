#!/bin/bash
# ejecutar desde el anfitrión, con los contenedores ya levantados
sudo docker exec vlc-client bash -c "
  tcpdump -i eth0 port 1935 -w /capturas/trafico_rtmp.pcap &
  TCPDUMP_PID=\$!
  sleep 1
  ffmpeg -re -f lavfi -i testsrc=size=640x360:rate=30 \
    -f lavfi -i sine=frequency=1000 -t 14 \
    -c:v libx264 -preset ultrafast -pix_fmt yuv420p \
    -c:a aac -f flv rtmp://172.28.0.10/live/tarea2 \
    > /capturas/ffmpeg_publish.log 2>&1 &
  sleep 3
  cvlc -vvv rtmp://172.28.0.10/live/tarea2 --run-time=8 \
    --vout=dummy --aout=dummy vlc://quit \
    > /capturas/vlc_client.log 2>&1
  sleep 2
  kill -2 \$TCPDUMP_PID
  ls -lh /capturas/
"
