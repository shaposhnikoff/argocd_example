FROM python:3.8-buster

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

COPY ./app.py /app/app.py
COPY ./wsgi.ini /app/wsgi.ini

WORKDIR /app

CMD ["uwsgi", "/app/wsgi.ini"]


