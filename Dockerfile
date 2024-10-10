#FROM python:3.8.0-alpine3.10
FROM python:3.11-alpine3.20
#Python docker images: https://github.com/docker-library/docs/tree/master/python/

USER root

# Copy the src
WORKDIR /app
COPY src/ /app/src/
COPY ./requirements.txt /app
RUN ls -la /app

# Install python dependencies
RUN python3 --version
RUN pip install --upgrade pip
RUN pip install Flask
#RUN pip install --no-cache-dir -r /app/requirements.txt
RUN pip list --format=columns

USER 1001

# EXPOSE 5001
ENTRYPOINT ["python3", "/app/src/app.py"]
