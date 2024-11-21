#!/bin/sh

until cd /app/ecommerce
do
    echo "Waiting for server volume..."
done


until python manage.py migrate
do
    echo "Waiting for db to be ready..."
    sleep 2
done



# Check if the environment is development or production
if [ "$DEVELOPMENT_MODE" = "True" ]; then
    # For development, use Django's development server with live reloading
    echo "Running in development mode"
    exec python manage.py runserver 0.0.0.0:8000
else
    # For production, use Gunicorn
    echo "Running in production mode"
    exec python manage.py collectstatic --noinput
    exec gunicorn src.wsgi:application --bind 0.0.0.0:8000 --workers 4 --threads 4
fi