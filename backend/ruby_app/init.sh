#!/bin/bash

# Preguntar el nombre de la aplicación
read -p "Nombre de la aplicación Rails: " APP_NAME

# Crear la estructura base si no existe
if [ ! -d /app/$APP_NAME ]; then
  echo "Creando nueva aplicación Rails: $APP_NAME..."
  rails new $APP_NAME --database=postgresql
  cd /app/$APP_NAME
else
  echo "Usando aplicación Rails existente: $APP_NAME..."
  cd /app/$APP_NAME
fi

# Configurar la base de datos (si es necesario)
if [ ! -f config/database.yml ]; then
  echo "Configurando database.yml..."
  cat > config/database.yml <<EOL
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: docker_admin
  password: d0ck3rpsswrd
  host: postgres

development:
  <<: *default
  database: ${APP_NAME}_development

test:
  <<: *default
  database: ${APP_NAME}_test
EOL
fi

# Instalar dependencias de Gemfile
bundle install

# Crear y migrar la base de datos
rails db:create
rails db:migrate

# Iniciar el servidor Rails
echo "Aplicación Rails '$APP_NAME' lista en http://localhost:3001"
rails server -b 0.0.0.0 -p 3001