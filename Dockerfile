# Imagen base fácil para tModLoader 1.4 con soporte para versiones específicas
FROM jacobsmile/tmodloader1.4:v2025.08.3.1

# Crea directorios para mundos y configs
RUN mkdir -p /config/worlds /config/mods

# Copia tu config del servidor
COPY serverconfig.txt /config/serverconfig.txt

# Copia mundo (si lo tienes)
COPY worlds/ /config/worlds/

# Copia script de inicio
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Puerto del servidor
EXPOSE 7777

# Ejecuta
CMD ["/start.sh"]