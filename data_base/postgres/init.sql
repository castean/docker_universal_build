-- Crear el usuario solo si no existe
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'docker_admin') THEN
        CREATE USER docker_admin WITH PASSWORD 'd0ck3rpsswrd';
    END IF;
END
$$;

-- Crear la base de datos solo si no existe
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'development_db') THEN
        CREATE DATABASE development_db;
    END IF;
END
$$;

-- Otorgar privilegios solo si la base de datos existe
GRANT ALL PRIVILEGES ON DATABASE development_db TO docker_admin;