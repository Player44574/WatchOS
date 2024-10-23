#!/bin/bash

# Verificar si se ha pasado un argumento
if [ $# -lt 1 ]; then
    echo "Uso: $0 <SSID>"
    exit 1
fi

# Asignar el SSID a una variable
SSID="$1"

# Verificar si la red Wi-Fi está guardada
nmcli connection show "$SSID" >/dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "La red Wi-Fi '$SSID' no está guardada."
    exit 1
fi

# Eliminar la red Wi-Fi
nmcli connection delete "$SSID"

# Verificar si la red fue eliminada correctamente
if [ $? -eq 0 ]; then
    echo "Red Wi-Fi '$SSID' olvidada correctamente."
else
    echo "Error al olvidar la red Wi-Fi '$SSID'."
    exit 1
fi