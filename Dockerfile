FROM python:3.7-alpine
MAINTAINER Neeraj Gupta

ENV PYTHONUNBUFFERED 1
COPY ./requirements.txt /requirements.txt
# Dependency for postgresql support
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-postgres-build-deps \
        gcc libc-dev linux-headers postgresql-dev

RUN pip install -r /requirements.txt

RUN apk del .tmp-postgres-build-deps


RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
