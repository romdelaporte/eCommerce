# Ecommerce Site built in Django

### Requirements:
- Django
- ~~Postgres~~
- RabbitMQ
- Redis

### Features
- ✅ Tailwind UI Design
- ✅ Ecommerce: catalog, cart session and orders
- ✅ Payments using Stripe
- ✅ Stripe webhook implemented
- ✅ Sending confirmation emails with PDF bill attached
- ✅ CSV Export
- ✅ Recommendation system for products
- ✅ Multi language support


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
- [X] Docker Stripe
- [X] Redis 
- [X] RabbitMQ and celery
- [ ] TailwindCSS
- [ ] Staticfiles


### Installation
1.- In src.settings chose your email backend, if using Gmail accept stwo steps verification in myaccount.google.com, then in the search bar search for app password and assign a password. Use the code from the app password in your .env-example file
2.- Edit the `.env-example` file with the proper values
3.- docker-compose  --env-file .env-example up 
4.- Install Stripe CLI in your local machine


### Development


### Commands
- docker run -it --rm --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:management
- docker run -it --rm --name redis -p 6379:6379 redis
- python manage.py runserver
- celery -A src worker -l info
- celery -A src flower
- docker compose --env-file .env up
- stripe listen --forward-to localhost:8000/payment/webhook/


### Notes:
1.- Asynchronous tasks: RabbitMQ, Celery worker, send email task, trigger task from view
2.- Asynchronous tasks: Flower. localhost:5555
3.- Stripe: Atlas, Development mode, STRIPE_API_VERSION & KEYS, order view launch task, set order in user's session
4.- Stripe: In payments.views create a stripe session checkout with session's data (currency, quantity, price)
5.- Stripe testing: RabbitMQ, celery worker
6.- Stripe Webhook: payments.webhooks, stripe event webhook triggers order.paid=True and order.stripe_id
7.- Stripe Webhook testing: Stripe CLI, allow to access account information (test). Stripe listen to localhost:8000/payment/webhook/ 
8.- Stripe Webhook: https://dashboard.stripe.com/test/webhooks
9.- Stripe in Production: Use production credentials, instead of Stripe CLI use add a webhook endpoint at https://dashboard.stripe.com/webhooks 
10.- Redis Recommendation System: shop.recommender