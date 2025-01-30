#!/bin/bash

# Preguntar el nombre de la aplicación
read -p "Nombre de la aplicación Flask: " APP_NAME

# Crear la estructura base dentro de /app
mkdir -p /app/$APP_NAME
cd /app/$APP_NAME

# Crear un entorno virtual
python -m venv venv
source venv/bin/activate

# Crear un archivo requirements.txt con las dependencias necesarias
cat > requirements.txt <<EOF
fastapi==0.109.0
uvicorn==0.27.0
python-jose[cryptography]==3.3.0
passlib==1.7.4
python-multipart==0.0.6
sqlalchemy==2.0.23
psycopg2-binary==2.9.9
redis==5.0.1
pydantic==2.5.3
aioredis==2.0.1
asyncpg==0.29.0
python-dotenv==1.0.0
flask-swagger-ui==3.36.0
EOF

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
    app.run(host='0.0.0.0', port=5001)" > app.py
fi

# Iniciar la aplicación
echo "Proyecto Flask '$APP_NAME' creado en /app/$APP_NAME"
python app.py
