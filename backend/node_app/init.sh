#!/bin/bash

# Preguntar el nombre de la aplicación
read -p "Nombre de la aplicación Node.js: " APP_NAME

# Crear la estructura base
mkdir -p /app/$APP_NAME
cd /app/$APP_NAME

# Inicializar un proyecto Node.js si no existe
if [ ! -f package.json ]; then
  npm init -y
fi

# Instalar dependencias básicas
npm install express

# Iniciar la aplicación
echo "Proyecto Node.js '$APP_NAME' creado en /app/$APP_NAME"
npm start