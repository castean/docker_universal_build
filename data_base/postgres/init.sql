-- Crear el usuario solo si no existe
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'docker_admin') THEN
        CREATE USER docker_admin WITH PASSWORD 'd0ck3rpsswrd';
    END IF;
END
$$;

-- Crear la base de datos solo si no existe
-- Primero, comprobamos si la base de datos ya existe
SELECT 
    CASE 
        WHEN NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'development_db') THEN
            RAISE NOTICE 'Creando la base de datos "development_db"';
            PERFORM dblink_exec('host=localhost user=postgres password=secret dbname=postgres', 'CREATE DATABASE development_db');
        ELSE
            RAISE NOTICE 'La base de datos "development_db" ya existe';
    END CASE;

-- Conectar a la base de datos 'development_db' para otorgar privilegios
\c development_db;

-- Otorgar privilegios solo si la base de datos existe
GRANT ALL PRIVILEGES ON DATABASE development_db TO docker_admin;
