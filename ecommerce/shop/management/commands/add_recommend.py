from django.core.management.base import BaseCommand, CommandError

from shop.models import Product
from shop.recommender import Recommender



class Command(BaseCommand):
    help = "Closes the specified poll for voting"

    def add_arguments(self, parser):
        pass

    def handle(self, *args, **options):
        product_1 = Product.objects.get(id=1)
        product_2 = Product.objects.get(id=2)
        product_3 = Product.objects.get(id=4)

        r = Recommender()
        r.products_bought([product_1, product_2, product_3])
        self.stdout.write(self.style.SUCCESS('Successfully added recommended products'))