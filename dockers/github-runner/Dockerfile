ARG ARCH=

FROM ${ARCH}ubuntu:20.04

WORKDIR /actions-runner

RUN apt-get update -qqy && \
  apt-get install -qqy curl less

COPY entrypoint.sh .
COPY install-multi-arch.sh .

ENV RUNNER_VERSION=2.277.1 \
  TK_VERSION=0.14.0 \
  KUBECTL_VERSION=1.20.0

RUN ./install-multi-arch.sh && ./bin/installdependencies.sh

RUN adduser --uid 1001 --gecos "" --home /actions-runner --disabled-login --disabled-password runner && \
  chown -R runner /actions-runner

USER runner

ENTRYPOINT ["/bin/bash"]
CMD ["entrypoint.sh"]
