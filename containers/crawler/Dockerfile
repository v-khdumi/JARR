FROM python:3.6-slim

ADD . /code
WORKDIR /code
# Installing python dependencies
RUN pip install pipenv && pipenv sync
# Mount so your configuration is accessible from here
VOLUME /etc/
CMD ["pipenv", "run", "celery", "worker", "--app", "ep_celery.celery_app"]
