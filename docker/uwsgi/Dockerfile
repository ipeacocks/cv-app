FROM alpine:3.7

EXPOSE 5000
WORKDIR /usr/src/app

RUN apk add --no-cache \
        uwsgi-python3 \
        python3 \
        python3-dev \
        build-base \
        linux-headers \
        mariadb-dev \
     && rm -rf /var/cache/apk/*

COPY app/project .

RUN pip3 install --no-cache-dir -r requirements.txt

CMD uwsgi --socket 0.0.0.0:5000 --uid uwsgi --plugins python3 --enable-threads --wsgi run:app
