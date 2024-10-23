#!/bin/bash

# Obtener una lista de todas las conexiones Wi-Fi guardadas
saved_networks=$(nmcli connection show | grep wifi | awk '{print $1}')

if [ -z "$saved_networks" ]; then
    echo "No hay redes Wi-Fi guardadas para eliminar."
    exit 0
fi

# Recorrer y eliminar cada red guardada
for network in $saved_networks; do
    echo "Olvidando red: $network"
    nmcli connection delete "$network"
    
    if [ $? -eq 0 ]; then
        echo "Red $network olvidada correctamente."
    else
        echo "Error al olvidar la red $network."
    fi
done

echo "Todas las redes Wi-Fi guardadas han sido olvidadas."