#!/bin/bash

# Verificar si se han pasado los argumentos necesarios
if [ $# -lt 2 ]; then
    echo "Uso: $0 <SSID> <contraseña>"
    exit 1
fi

# Asignar los argumentos a variables
SSID="$1"
PASSWORD="$2"

# Verificar si la red ya está configurada (perfil existente en NetworkManager)
nmcli connection show | grep -q "$SSID"
if [ $? -eq 0 ]; then
    echo "Conectando a la red Wi-Fi $SSID..."
    nmcli connection up "$SSID"
else
    echo "Red no configurada. Creando nueva conexión..."
    nmcli dev wifi connect "$SSID" password "$PASSWORD"
fi

# Verificar si la conexión fue exitosa
if [ $? -eq 0 ]; then
    echo "Conectado a $SSID con éxito."
else
    echo "Error al conectarse a $SSID. Verifique la contraseña y el SSID."
    exit 1
fi