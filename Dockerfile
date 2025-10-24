# Usa imagen oficial de tModLoader
FROM ryansheehan/tmodloader

# Copia mods y configs
COPY mods/ /server/mods/
COPY worlds/ /server/worlds/
COPY serverconfig.txt /server/serverconfig.txt
COPY start.sh /start.sh

# Permisos
RUN chmod +x /start.sh

# Puerto
EXPOSE 7777

# Ejecutar
CMD ["/start.sh"]