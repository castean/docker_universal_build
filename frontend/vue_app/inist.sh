#!/bin/bash

# Preguntar el nombre de la aplicación
read -p "Nombre de la aplicación Vue: " APP_NAME

# Crear la estructura base
mkdir -p /app/$APP_NAME
cd /app/$APP_NAME

# Inicializar un proyecto Vue si no existe
if [ ! -f package.json ]; then
  npm install -g @vue/cli
  vue create . -n -d
fi

# Instalar dependencias
npm install

# Iniciar la aplicación
echo "Proyecto Vue '$APP_NAME' creado en /app/$APP_NAME"
npm run serve