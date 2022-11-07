FROM python:3.11
WORKDIR /app

COPY requirements.txt /app/requirments.txt
RUN pip install -r requirments.txt
COPY . /app

RUN bash -c "chmod +x /app/release.sh"
