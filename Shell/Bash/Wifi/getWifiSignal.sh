#!/bin/bash
# Obtener la potencia de la señal Wi-Fi
signal_strength=$(iwconfig wlan0 | grep 'Link Quality' | awk '{print $2}' | cut -d'=' -f2)
echo $signal_strength