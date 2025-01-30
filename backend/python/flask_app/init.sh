#!/bin/bash

# Preguntar el nombre de la aplicación
read -p "Nombre de la aplicación Flask: " APP_NAME

# Crear la estructura base
mkdir -p /app/$APP_NAME
cd /app/$APP_NAME

# Crear un entorno virtual
python -m venv venv
source venv/bin/activate

# Crear un archivo requirements.txt si no existe
if [ ! -f requirements.txt ]; then
  echo "Flask==3.0.0" > requirements.txt
fi

# Instalar dependencias
pip install -r requirements.txt

# Crear un archivo app.py básico
if [ ! -f app.py ]; then
  echo "from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hola, mundo!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)" > app.py
fi

# Iniciar la aplicación
echo "Proyecto Flask '$APP_NAME' creado en /app/$APP_NAME"
python app.py