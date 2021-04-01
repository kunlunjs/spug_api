FROM python:3.9.2-alpine3.13 as builder

COPY requirements.txt .

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update && apk add  --no-cache build-base mariadb-dev openldap-dev

RUN apk add --no-cache --virtual .build-deps openssl-dev gcc python3-dev musl-dev libffi-dev make 

RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ \
    && pip install -U pip \
    && pip install wheel && pip wheel -r requirements.txt  --wheel-dir=/pippacks/wheels \
    && pip wheel gunicorn[gevent] --wheel-dir=/pippacks/wheels \
    && apk del .build-deps



FROM python:3.9.2-alpine3.13

WORKDIR /spug_api

COPY . /spug_api/
COPY --from=builder /pippacks /pippacks

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update && apk add  --no-cache supervisor openldap-dev openssh-client mariadb-dev git bash

RUN mkdir /etc/supervisor.d

RUN pip install --no-index --find-links=/pippacks/wheels -r requirements.txt && pip install gunicorn[gevent] --no-index --find-links=/pippacks/wheels

RUN rm -rf /pippacks

ENTRYPOINT ["sh", "entrypoint.sh"]