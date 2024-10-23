#!/bin/bash

# Obtener el estado actual del Wi-Fi
wifi_status=$(nmcli radio wifi)

if [ "$wifi_status" = "enabled" ]; then
    echo "El Wi-Fi está activado. Desactivando..."
    nmcli radio wifi off
    if [ $? -eq 0 ]; then
        echo "Wi-Fi desactivado correctamente."
    else
        echo "Error al desactivar el Wi-Fi."
        exit 1
    fi
else
    echo "El Wi-Fi está desactivado. Activando..."
    nmcli radio wifi on
    if [ $? -eq 0 ]; then
        echo "Wi-Fi activado correctamente."
    else
        echo "Error al activar el Wi-Fi."
        exit 1
    fi
fi