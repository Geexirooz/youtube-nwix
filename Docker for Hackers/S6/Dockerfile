# Alpine + Bash
FROM alpine
CMD ["echo", "Hello from Docker!"]


# C application (from scratch)
FROM scratch
COPY hello /hello
CMD ["/hello"]

# Python application
FROM python:3.10-slim
WORKDIR /app
COPY app.py .
CMD ["python", "app.py"]
