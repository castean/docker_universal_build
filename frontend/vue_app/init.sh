#!/bin/bash

# Preguntar el nombre de la aplicación
read -p "Nombre de la aplicación Vue: " APP_NAME
APP_NAME=${APP_NAME:users_creations}

# Crear la estructura base
mkdir -p /app/$APP_NAME
cd /app/$APP_NAME

# Inicializar un proyecto Vue si no existe
if [ ! -f package.json ]; then
  # Crear el proyecto Vue con la versión 3
  vue create $APP_NAME --default --packageManager npm

  # Cambiar las dependencias de Vue a la versión 3
  npm install vue@next

  # Instalar dependencias necesarias de forma predeterminada
  npm install axios pinia quasar vuetest typescript

  # Instalar dependencias necesarias de Vue para pruebas unitarias
  npm install @vue/test-utils vue-jest jest --save-dev
fi

# Iniciar la aplicación
echo "Proyecto Vue '$APP_NAME' creado en /app/$APP_NAME"

# Ejecutar el servidor de desarrollo
npm run serve
