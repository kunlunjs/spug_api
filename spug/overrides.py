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
        'LOCATION': 'redis://redis:6379',
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
            "CONNECTION_POOL_KWARGS": {"max_connections": 100},
            'SOCKET_TIMEOUT': 10,
        }
    }
}

ALLOWED_HOSTS = ['web']