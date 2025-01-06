FROM ubuntu:noble

COPY *.sh /

RUN apt-get update -qqy && \
    apt-get install -qqy mariadb-client postgresql-client apt-transport-https ca-certificates gnupg curl

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
    apt-get update -qqy && \
    apt-get install -qqy google-cloud-sdk

RUN rm -rf /var/lib/apt/lists/*

ENV CLOUDSDK_CONFIG=/tmp/.gcloud
