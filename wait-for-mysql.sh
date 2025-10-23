#!/bin/bash

echo "Waiting for MySQL to be ready..."

# Loop until MySQL is reachable
until nc -z mysql-db 3306; do
  echo "MySQL is unavailable - sleeping"
  sleep 2
done

echo "MySQL is up - starting application"

# Start the Spring Boot app
exec java -jar app.jar