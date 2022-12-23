FROM python:3.9-alpine

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN apk --no-cache add gcc musl-dev && \
    pip3 install -r requirements.txt && \
    apk del gcc musl-dev

COPY poifier-client.py poifier-client.py

ENTRYPOINT [ "python3", "./poifier-client.py" ]
