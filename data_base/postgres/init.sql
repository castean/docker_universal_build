-- Crear el usuario solo si no existe
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'docker_admin') THEN
        CREATE USER docker_admin WITH PASSWORD 'd0ck3rpsswrd';
    END IF;
END
$$;

-- Verificar si la base de datos existe y crearla si no existe
SELECT 
    CASE
        WHEN NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'development_db') THEN
            'Creando la base de datos "development_db"'
        ELSE
            'La base de datos "development_db" ya existe'
    END;

-- Creación de la base de datos fuera de un bloque DO, se ejecuta directamente
-- Solo se ejecutará si no existe previamente la base de datos
CREATE DATABASE IF NOT EXISTS development_db;

-- Conectar a la base de datos 'development_db' después de su creación
\c development_db;

-- Otorgar privilegios solo si la base de datos existe
GRANT ALL PRIVILEGES ON DATABASE development_db TO docker_admin;
