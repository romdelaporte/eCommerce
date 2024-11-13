# Ecommerce Site built in Django

### Requirements:
- Django
- ~~Postgres~~
- RabbitMQ
- Redis

### Features
- ✅ Catalog, Cart, and Orders
- ✅ Payments using Stripe
- ✅ Celery and Flower for task queuing
- ✅ CSV Export
- ✅ Send email with PDF bill
- ✅ Recommendation system for products
- ✅ Multi language using Rosseta, Parler, and localflavour


### Installation
- `python3 -m venv venv`
- `pip install -r requirements.txt`

### To DO
- [X] Install RabbitMQ
- [X] Install Celery
- [X] Install Flower
- [X] Install Redis
- [X] Add Stripe: Keys
- [X] Install Stripe CLI
- [ ] Docker Stripe
- [ ] Staticfiles
- [X] Redis 
- [ ] RabbitMQ and celery
- [ ] Styles


### Installation
1.- Edit the `.env-example` file with 
2.- docker-compose  --env-file .env-example up 
9.- Install Stripe CLI in your local machine


### Commands
- docker run -it --rm --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:management
- docker run -it --rm --name redis -p 6379:6379 redis
- python manage.py runserver
- celery -A src worker -l info
- celery -A src flower
- stripe listen --forward-to localhost:8000/payment/webhook/