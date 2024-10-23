#!/bin/bash
# Listar redes Wi-Fi con señal y seguridad, filtrar duplicados y redes sin SSID

# Obtener la lista de redes con SSID, señal y seguridad
sudo nmcli -f SSID,SIGNAL,SECURITY dev wifi list | \
# Eliminar redes sin SSID (donde SSID es --)
grep -v -e "^--" | \
# Filtrar la cabecera de la salida del comando nmcli
grep -v "SSID" | \
# Ordenar por SSID y luego por señal (de mayor a menor)
sort -k1,1 -k2,2nr | \
# Usar awk para quedarnos solo con las redes con la mejor señal
awk '!seen[$1]++'