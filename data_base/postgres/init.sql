-- Conectarse a la base de datos principal
\c postgres;

-- Verificar si la base de datos existe y crearla solo si no existe
SELECT 'CREATE DATABASE development_db' 
WHERE NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'development_db')
\gexec

-- Conectarse a la base de datos creada
\c development_db;

-- Crear usuario si no existe y actualizar la contraseña si ya existe
DO
$$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'docker_admin') THEN
        CREATE USER docker_admin WITH PASSWORD 'd0ck3rpsswrd';
    ELSE
        ALTER USER docker_admin WITH PASSWORD 'd0ck3rpsswrd';
    END IF;
END
$$;

-- Asignar permisos al usuario
GRANT ALL PRIVILEGES ON DATABASE development_db TO docker_admin;
