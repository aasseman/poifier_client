FROM python:3.9.15-alpine3.16

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN apk --no-cache add gcc musl-dev && \
    pip3 install -r requirements.txt && \
    apk del gcc musl-dev

COPY . .

ENTRYPOINT [ "python3", "./poifier-client.py" ]
