#!/bin/bash

# Obtener información de almacenamiento del sistema
# Filtra el sistema de archivos principal (asume que está montado en '/')
storage_info=$(df -h / | tail -1)

# Extraer los valores específicos
total_size=$(echo $storage_info | awk '{print $2}')
used_size=$(echo $storage_info | awk '{print $3}')
available_size=$(echo $storage_info | awk '{print $4}')
usage_percentage=$(echo $storage_info | awk '{print $5}')

# Mostrar la información de almacenamiento
echo "Tamaño total: $total_size"
echo "Usado: $used_size"
echo "Disponible: $available_size"
echo "Porcentaje de uso: $usage_percentage"
