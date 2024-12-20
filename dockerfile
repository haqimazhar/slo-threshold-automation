# Base image
FROM python:3.13.0-alpine3.20

# #update, install curl, git, zip/unzip
# RUN apk update \
#     && apk add bash \
#     && apk add curl zip git unzip iputils

# #install aws cli
# RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
#     && unzip awscliv2.zip \
#     && ./aws/install -i /usr/local/aws-cli -b /usr/local/bin \
#     && rm awscliv2.zip
# Set working directory
WORKDIR /home/app
# ENV AWS_SHARED_CREDENTIALS_FILE=/home/myapp/.aws/credentials
# ENV AWS_CONFIG_FILE=/home/myapp/.aws/config

# Copy necessary files
COPY main.py /home/app/main.py
COPY utils/functions.py /home/app/utils/functions.py
COPY utils/cli.py /home/app/utils/cli.py
COPY config.yaml /home/app/config.yaml
COPY requirements.txt /home/app/requirements.txt

# Install dependencies
RUN pip install -r requirements.txt

# Action entrypoint
ENTRYPOINT ["python", "/home/app/main.py"]
