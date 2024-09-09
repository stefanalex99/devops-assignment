FROM python:3.9

RUN pip install --no-cache-dir flask

WORKDIR /app

COPY ./hello_world.py /app

EXPOSE 8080

CMD ["python", "hello_world.py"]
