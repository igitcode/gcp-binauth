FROM python:3.9.10


# Add Files
RUN mkdir /app
WORKDIR /app
#COPY requirements.txt /app
COPY src/ /app/src/
#COPY commands.json /app
#COPY customers.json /app
# the .gcp-creds.json file is created by CloudBuild job
#COPY .gcp-creds.json /app

# prepare python ENV
RUN pip install pipenv
#RUN pipenv run pip3 install -r requirements.txt --target ./.local

# set slack ENV vars
#ARG SLACK_BOT_API_ARG
#ARG SLACK_APP_API_ARG
#ARG SLACK_SIGNING_SECRET_ARG

#ENV SLACK_BOT_TOKEN=${SLACK_BOT_API_ARG}
#ENV SLACK_APP_TOKEN=${SLACK_APP_API_ARG}
#ENV SLACK_SIGNING_SECRET=${SLACK_SIGNING_SECRET_ARG}
#ENV GOOGLE_APPLICATION_CREDENTIALS=${GCP_CREDS}
#ENV GOOGLE_APPLICATION_CREDENTIALS="/app/.gcp-creds.json"

#expose port for Cloudrun
#ARG PORT_ARG
ENV PORT=8080
EXPOSE 8080

# set image runtime command
# the -u flag allows python to send logs to stdout in unbuffered manor, required to see logs in Docker
CMD ["pipenv", "run", "python", "-u", "-m", "src.main"]
