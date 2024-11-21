# Ecommerce Site built in Django


### Features
- ✅ Tailwind UI Design
- ✅ Multi language support
- ✅ Ecommerce: catalog, cart session and orders
- ✅ Payments using Stripe
- ✅ Stripe webhook implemented
- ✅ Sending confirmation emails with PDF bill attached
- ✅ CSV Export
- ✅ Recommendation system for products



### Installation
- 1. In src.settings chose your email backend, if using Gmail accept stwo steps verification in myaccount.google.com, then in the search bar search for app password and assign a password. Use the code from the app password in your `.env-example` file
- 2. Edit the `.env-example` file with the proper values and rename it to .env
- 3. run `docker-compose up`
- 4. run in another terminal `docker compose exec -it web sh -c "cd ecommerce && celery -A src worker -l info"` <- You can add it to docker compose
- 5. run in another terminal `docker compose exec -it web sh -c "cd ecommerce && celery -A src flower"`. Visit localhost:5555 <- You can add it to docker compose
- 4. Install Stripe CLI in your local machine and login with your credentials
- 5. run `stripe listen --forward-to localhost:8000/payment/webhook/`  -> visit https://dashboard.stripe.com/test/webhooks for displayed webhooks

### For development:
- I have excluded Postres for this project to make it easier for newerst to get started.
- For development docker compose handles all the reload on its volume. The entrypoint runs manage.py but for deployment purpose it runs gunicorn
- To edit the styles make sure to install tailwindcss and run `tailwindcss -i static/css/input.css -o static/css/output.css --watch`inside the ecommerce directory.



### Developer notes:
1.- Asynchronous tasks: RabbitMQ, Celery worker, send email task, trigger task from view
2.- Asynchronous tasks: Flower. 
3.- Stripe: Atlas, Development mode, STRIPE_API_VERSION & KEYS, order view launch task, set order in user's session
4.- Stripe: In payments.views create a stripe session checkout with session's data (currency, quantity, price)
5.- Stripe testing: RabbitMQ, celery worker
6.- Stripe Webhook: payments.webhooks, stripe event webhook triggers order.paid=True and order.stripe_id
7.- Stripe Webhook testing: Stripe CLI, allow to access account information (test). Stripe listen to localhost:8000/payment/webhook/ 
8.- Stripe Webhook: 
9.- Stripe in Production: Use production credentials, instead of Stripe CLI use add a webhook endpoint at https://dashboard.stripe.com/webhooks 
10.- Redis Recommendation System: shop.recommender
