# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# Set the working directory
RUN mkdir -p /app/ecommerce
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libpango1.0-0 \
    libcairo2 \
    libgdk-pixbuf2.0-0 \
    libffi-dev \
    shared-mime-info \
    weasyprint \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt /app/ecommerce
RUN pip install --upgrade pip
RUN pip install -r ecommerce/requirements.txt


# Copy the entrypoint script into the container
COPY ./entry/entrypoint.sh /app
RUN chmod +x /app/entrypoint.sh
#COPY ./Docker/worker.sh /app


# Copy the Django project code into the container
COPY ./ecommerce /app/ecommerce


# Expose the port the app runs on
#EXPOSE 8000

# Run the application
#CMD ["gunicorn", "src.wsgi:application", "--bind", "0.0.0.0:8000"]


# COPY ./compose/local/django/entrypoint /entrypoint
# RUN sed -i 's/\r$//g' /entrypoint
# RUN chmod +x /entrypoint

# COPY ./compose/local/django/start /start
# RUN sed -i 's/\r$//g' /start
# RUN chmod +x /start

# COPY ./compose/local/django/celery/worker/start /start-celeryworker
# RUN sed -i 's/\r$//g' /start-celeryworker
# RUN chmod +x /start-celeryworker

# COPY ./compose/local/django/celery/beat/start /start-celerybeat
# RUN sed -i 's/\r$//g' /start-celerybeat
# RUN chmod +x /start-celerybeat

# COPY ./compose/local/django/celery/flower/start /start-flower
# RUN sed -i 's/\r$//g' /start-flower
# RUN chmod +x /start-flower

# RUN chmod +x /app/entrypoint.sh
# RUN chmod +x /app/worker.sh

 #ENTRYPOINT ["/app/entrypoint.sh"]