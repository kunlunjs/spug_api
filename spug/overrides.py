DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'spug',
        'USER': 'root',
        'PASSWORD': 'kriswell',
        'HOST': 'db',
        'PORT': 3306
    }
}

CACHES = {
    "default": {
        "BACKEND": "django_redis.cache.RedisCache",
        'LOCATION': 'redis://redis:6379/1',
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
        }
    }
}

CHANNEL_LAYERS = {
    "default": {
        "BACKEND": "channels_redis.core.RedisChannelLayer",
        "CONFIG": {
            "hosts": [("redis", 6379)],
            "capacity": 1000,
            "expiry": 120,
        },
    },
}

ALLOWED_HOSTS = ['web']