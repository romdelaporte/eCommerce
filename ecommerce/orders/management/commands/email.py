from django.core.management.base import BaseCommand, CommandError
from io import BytesIO
from django.core.mail import EmailMessage
from django.template.loader import render_to_string
from django.conf import settings
from django.core.mail import send_mail



class Command(BaseCommand):
    help = "Closes the specified poll for voting"

    def add_arguments(self, parser):
        pass

    def handle(self, *args, **options):
        send_mail(
                "Subject here",
                "Here is the message.",
                "No-reply",
                ["someemailtorecieve@gmail.com"],
                fail_silently=False,
            )
        self.stdout.write(
                self.style.SUCCESS('Successfully email sent')
            )