# coding: utf-8
from django.apps import AppConfig


class LoggerAppConfig(AppConfig):

    name = 'onadata.apps.logger'

    def ready(self):
        # Makes sure all signal handlers are connected
        from onadata.apps.logger import signals
        # Monkey patch reversion package to insert real user in DB instead of
        # system account superuser.
        from kobo_service_account.utils import reversion_monkey_patch
        reversion_monkey_patch()
        super().ready()
