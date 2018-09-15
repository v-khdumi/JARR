FROM python:3.5-slim

COPY docker_files/logging.ini /etc/jarr_logging.ini
COPY docker_files/gunicorn.py /etc/gunicorn.py
ADD . /code
WORKDIR /code
# Installing python dependencies
RUN pip install pipenv && pipenv sync && pip install gunicorn json-logging-py
# Mount so your configuration is accessible from here
VOLUME /etc/
EXPOSE 8000
CMD ["/usr/local/bin/gunicorn", "--config", "/etc/gunicorn.py", "--log-config", "/etc/jarr_logging.ini", "-b", "0.0.0.0:8000", "wsgi:application"]
