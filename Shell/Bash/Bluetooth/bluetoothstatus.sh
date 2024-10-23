#!/bin/bash
# Verificar si el sistema Bluetooth está activo
bluetooth_status=$(systemctl is-active bluetooth)
echo $bluetooth_status