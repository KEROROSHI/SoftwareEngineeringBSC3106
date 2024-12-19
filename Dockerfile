# Base image
FROM ubuntu:22.04

# Author
LABEL authors="Jason"

# Installing System Dependacies
RUN apt update && apt upgrade -y && apt install python3 -y && apt install python3-pip -y && apt-get install libmysqlclient-dev -y && apt-get install pkg-config -y

# Setting Working Directory
WORKDIR /app

# Copying the most essential file into the working directory first
COPY requirements.txt /app

# Setting python3 to path
RUN export PATH="$HOME/.local/bin:$PATH"

RUN export MYSQLCLIENT_CFLAGS="-I/usr/include/mysql"

RUN export MYSQLCLIENT_LDFLAGS="-L/usr/lib/x86_64-linux-gnu -lmysqlclient"

# Installs the dependancies and packages listed in requirements.txt
RUN pip install -r requirements.txt

# Copies the rest of the files into the working directory app
COPY . /app

# Exposes the port 5001 to the container for usage
EXPOSE 5001

# Command to run the flask app
CMD ["python3","run.py"]