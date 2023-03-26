#FROM python:3.9

# Установка зависимостей
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        python3-dev \
        libpq-dev \
        libjpeg-dev \
        libffi-dev \
        libssl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Установка зависимостей Python
RUN pip install --upgrade pip
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Копирование приложения в Docker-образ
WORKDIR /app
COPY . /app

# Запуск приложения
CMD python manage.py runserver 0.0.0.0:8000
