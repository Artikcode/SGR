FROM python:3.9-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем и создаем файл app.py
RUN echo "\
from flask import Flask\n\
app = Flask(__name__)\n\
@app.route('/')\n\
def home():\n\
    return 'Hello, World from Koyeb!'\n\
if __name__ == '__main__':\n\
    app.run(host='0.0.0.0', port=5000)\n\
" > app.py

# Устанавливаем Flask
RUN pip install --no-cache-dir flask

# Определяем переменные окружения
ENV FLASK_APP=app.py

# Команда запуска Flask
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
