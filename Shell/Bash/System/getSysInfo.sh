#!/bin/bash

# Obtener nombre de usuario y nombre de host
user_host=$(echo "$USER@$(hostname)")

# Obtener el sistema operativo
os_name=$(grep '^PRETTY_NAME' /etc/os-release | cut -d '=' -f2 | tr -d '"')

# Obtener la arquitectura del sistema
arch=$(uname -m)

# Obtener la versión del kernel
kernel_version=$(uname -r)

# Obtener información de la CPU (número de núcleos y velocidad en GHz)
cpu_cores=$(grep -c ^processor /proc/cpuinfo)
cpu_speed_mhz=$(awk -F': ' '/^cpu MHz/ {print $2; exit}' /proc/cpuinfo)
cpu_speed_ghz=$(echo "scale=2; $cpu_speed_mhz / 1000" | bc)  # Convertir de MHz a GHz

# Obtener memoria RAM en GB
total_memory_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
total_memory_gb=$(echo "scale=2; $total_memory_kb / 1024 / 1024" | bc)  # Convertir de kB a GB

# Mostrar la información
echo "$user_host"
echo "OS: $os_name"
echo "Arch: $arch"
echo "Kernel: $kernel_version"
echo "CPU: $cpu_cores Cores @ ${cpu_speed_ghz}GHz"
echo "Memory: ${total_memory_gb}GB"