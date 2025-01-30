#!/bin/bash

# Preguntar el nombre de la aplicación
read -p "Nombre de la aplicación Django: " APP_NAME

# Crear la estructura base
mkdir -p /app/$APP_NAME
cd /app/$APP_NAME

# Crear un entorno virtual
python -m venv venv
source venv/bin/activate

# Instalar Django
pip install django

# Crear un proyecto Django si no existe
if [ ! -f manage.py ]; then
  django-admin startproject $APP_NAME .
fi

# Iniciar la aplicación
echo "Proyecto Django '$APP_NAME' creado en /app/$APP_NAME"
python manage.py runserver 0.0.0.0:8000