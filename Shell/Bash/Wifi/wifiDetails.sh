#!/bin/bash

# Obtener la lista de redes Wi-Fi detectadas y sus detalles (sin IPv4/IPv6)
nmcli -f SSID,SECURITY,BSSID,FREQ,CHAN,RATE,MODE dev wifi list | \
grep -v "SSID" | awk '
{
    # Asignar las columnas a variables más legibles
    ssid = $1
    security = $2
    mac = $3
    frequency = $4
    channel = $5
    rate = $6
    mode = $7

    # Determinar la banda de la red en base a la frecuencia
    if (frequency < 3000) {
        band = "2.4 GHz"
    } else {
        band = "5 GHz"
    }

    # Imprimir la información formateada
    printf "SSID: %s\nProtocolo: %s\nSeguridad: %s\nBanda de Red: %s\nCanal: %s\nLímite de velocidad: %s\nDirección MAC: %s\n\n", ssid, mode, security, band, channel, rate, mac
}'

# Obtener información de la interfaz Wi-Fi activa usando ifconfig
wifi_interface=$(ifconfig | grep -B 1 "wlan" | grep -Eo '^[a-z0-9_]+')

if [ -n "$wifi_interface" ]; then
    echo "Información de IP para la interfaz Wi-Fi activa ($wifi_interface):"
    ifconfig "$wifi_interface" | grep -E 'inet |inet6 '
else
    echo "No hay conexiones Wi-Fi activas."
fi