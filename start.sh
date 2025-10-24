#!/bin/bash
echo "Iniciando servidor de tModLoader v2025.08.3.1..."

# Entrar al directorio del servidor
cd /tmodloader || exit 1

# Crear carpetas necesarias si no existen
mkdir -p /root/.local/share/Terraria/tModLoader/Worlds
mkdir -p /root/.local/share/Terraria/tModLoader/Mods

# Si no existe el archivo de configuración, crearlo por defecto
if [ ! -f serverconfig.txt ]; then
    echo "Creando serverconfig.txt por defecto..."
    cat > serverconfig.txt <<EOF
worldpath=/root/.local/share/Terraria/tModLoader/Worlds
modpath=/root/.local/share/Terraria/tModLoader/Mods
maxplayers=8
port=7777
password=
language=es-ES
autocreate=1
difficulty=0
npcstream=60
priority=1
EOF
fi

# Ejecutar el servidor sin Steam
echo "Lanzando tModLoaderServer..."
exec ./start-tModLoaderServer.sh -config serverconfig.txt -nosteam
