FROM ruby:3.3.0

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    yarn \
    && rm -rf /var/lib/apt/lists/*

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el script de inicialización
COPY init.sh /init.sh
RUN chmod +x /init.sh

# Punto de entrada para el script de inicialización
ENTRYPOINT ["/init.sh"]