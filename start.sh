#!/bin/bash
echo "Iniciando servidor de tModLoader ${TMOD_VERSION}..."
cd /tmodloader

# Dar permisos de ejecución al launcher principal (por si acaso)
chmod +x start-tModLoader.sh

# Ejecutar en modo servidor (headless)
./start-tModLoader.sh -server -config serverconfig.txt -nogui
