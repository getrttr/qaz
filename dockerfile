# Официальный образ Python от DockerHub
FROM python:3.10-slim-buster

# Устанавливаем зависимости, которые необходимы для работы Django
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        gcc \
        python3-dev \
        libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Установка зависимостей Python, необходимых для работы приложения
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Копирование всего приложения в контейнер
COPY . /app
WORKDIR /app

# Запуск приложения при старте контейнера
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
