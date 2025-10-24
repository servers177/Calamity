# Imagen base
FROM debian:bookworm-slim

# Variables
ENV TMOD_VERSION=v2025.08.3.1
ENV TMOD_DIR=/tmodloader
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

# Instalar dependencias
RUN apt-get update && apt-get install -y \
    wget unzip libicu-dev libssl3 locales && \
    locale-gen en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

# Crear carpeta e ir a ella
RUN mkdir -p $TMOD_DIR
WORKDIR $TMOD_DIR

# Descargar y extraer el tModLoader.zip
RUN wget https://github.com/tModLoader/tModLoader/releases/download/${TMOD_VERSION}/tModLoader.zip -O server.zip && \
    unzip server.zip && rm server.zip

# Copiar tus mods y configs
COPY . .

# Dar permisos de ejecución
RUN chmod +x start.sh

# Exponer el puerto del servidor
EXPOSE 7777

# Comando de inicio
CMD ["./start.sh"]
