#!/bin/bash
echo "Iniciando servidor de tModLoader ${TMOD_VERSION}..."
cd /tmodloader
# Iniciar con la configuración del archivo serverconfig.txt
./tModLoaderServer -config serverconfig.txt -steam
