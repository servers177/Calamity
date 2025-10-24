# Imagen base con .NET Runtime y utilidades
FROM debian:bookworm-slim

# Variables
ENV TMOD_VERSION=2025.08.3.1
ENV TMOD_DIR=/tmodloader
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

# Instalar dependencias
RUN apt-get update && apt-get install -y \
    wget unzip libicu-dev libssl3 locales && \
    locale-gen en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

# Crear carpeta y descargar el server
RUN mkdir -p $TMOD_DIR
WORKDIR $TMOD_DIR

# Descargar el servidor de tModLoader desde SteamCMD CDN (usa la versión estable del branch 2025)
RUN wget https://github.com/tModLoader/tModLoader/releases/download/${TMOD_VERSION}/tModLoader.Linux.Server.zip -O server.zip && \
    unzip server.zip && rm server.zip

# Copiar archivos locales (mods, configs)
COPY . .

# Dar permisos de ejecución al script
RUN chmod +x start.sh

# Exponer el puerto del server
EXPOSE 7777

# Comando de inicio
CMD ["./start.sh"]
