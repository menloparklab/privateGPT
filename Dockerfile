FROM python:3.11-slim-buster
RUN mkdir /app && apt update && apt install build-essential gcc git -y

COPY ./ /app

WORKDIR /app
ENV PYTHONPATH=${PYTHONPATH}:${PWD} 

RUN pip3 install poetry && poetry config virtualenvs.create false && poetry install

# ENTRYPOINT [ "gunicorn",  "app:app" "-k", "uvicorn.workers.UvicornWorker", "--timeout 1500" ]
