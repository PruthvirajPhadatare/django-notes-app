FROM python:3.9

WORKDIR /app/backend

COPY requirements.txt .

# Optional system dependencies (uncomment if needed)
# RUN apt-get update && apt-get install -y libpq-dev gcc

# Upgrade pip and install requirements with extended timeout
RUN pip install --upgrade pip && \
    pip install --default-timeout=100 --retries=5 -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
