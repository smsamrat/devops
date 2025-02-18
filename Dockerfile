FROM python:3.8

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt
RUN apt-get update && apt-get install -y libpq-dev gcc
COPY . /app

EXPOSE 8000
    
CMD ["python", "manage.py", "runserver"]