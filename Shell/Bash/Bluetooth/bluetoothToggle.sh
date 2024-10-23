#!/bin/bash

# Obtener el estado actual de Bluetooth
bluetooth_state=$(rfkill list bluetooth | grep "Soft blocked" | awk '{print $3}')

# Verificar si Bluetooth está habilitado
if [ "$bluetooth_state" == "yes" ]; then
    # Si está bloqueado, activarlo
    echo "Activando Bluetooth..."
    rfkill unblock bluetooth
    # Intentar habilitar el servicio de Bluetooth
    sudo systemctl start bluetooth
else
    # Si está habilitado, desactivarlo
    echo "Desactivando Bluetooth..."
    rfkill block bluetooth
    # Intentar deshabilitar el servicio de Bluetooth
    sudo systemctl stop bluetooth
fi

# Mostrar el nuevo estado de Bluetooth
new_state=$(rfkill list bluetooth | grep "Soft blocked" | awk '{print $3}')
if [ "$new_state" == "yes" ]; then
    echo "Bluetooth está ahora: desactivado"
else
    echo "Bluetooth está ahora: activado"
fi