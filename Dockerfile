FROM python:3.9-alpine3.13

WORKDIR /app

COPY requirements.txt .

RUN python3 -m pip install --upgrade pip && python -m pip install -r requirements.txt 

COPY . .

EXPOSE 80

CMD ["gunicorn", "--workers=3", "--bind", "0.0.0.0:80", "app:app"]

