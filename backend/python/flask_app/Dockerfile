FROM python:3.12-slim

# Crear el directorio /app
RUN mkdir -p /app
WORKDIR /app

# Copiar el script init.sh al contenedor
COPY init.sh /app/init.sh

# Dar permisos de ejecución al script
RUN chmod +x /app/init.sh

# Establecer el punto de entrada para ejecutar el script
ENTRYPOINT ["/app/init.sh"]