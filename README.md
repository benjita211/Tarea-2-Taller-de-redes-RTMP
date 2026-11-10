# Tarea 2: Análisis de tráfico RTMP con SRS y VLC

Taller de Redes y Servicios, Universidad Diego Portales.
Integrantes: Felipe Irribarra, Benjamin Aliaga.

## Contenido

- `Dockerfile.cliente`: imagen del cliente (VLC, ffmpeg, tcpdump).
- `docker-compose.yml`: red `172.28.0.0/24`, servidor SRS (172.28.0.10) y cliente (172.28.0.20).
- `comando_captura.sh`: publica un stream con ffmpeg, lo reproduce con VLC y captura el tráfico con tcpdump.
- `capturas/trafico_rtmp.pcap`: traza capturada (4.115 paquetes).
- `capturas/ffmpeg_publish.log` y `capturas/vlc_client.log`: registros de la ejecución.

## Cómo reproducir

1. Clonar el repositorio y entrar a la carpeta.
2. Crear la carpeta de capturas y levantar los contenedores:

   ```bash
   mkdir -p capturas
   sudo docker compose up -d --build
   sudo docker compose ps
   ```

3. Ejecutar la captura:

   ```bash
   bash comando_captura.sh
   ```

4. Abrir `capturas/trafico_rtmp.pcap` en Wireshark con el filtro `rtmpt`.
5. Para detener todo:

   ```bash
   sudo docker compose down
   ```

## Requisitos

Docker y Docker Compose y Wireshark para analizar la traza.
