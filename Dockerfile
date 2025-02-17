# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.10.12-bookworm

EXPOSE 8080

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
# Install pip requirements
COPY requirements.txt .
RUN pip3 install --upgrade pip
RUN python -m pip install -r requirements.txt


WORKDIR /app
COPY . /app


# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python", "app.py"]
