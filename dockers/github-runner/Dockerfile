ARG ARCH=

FROM ${ARCH}ubuntu:20.04
ARG RUNNER_VERSION=2.277.1

WORKDIR /actions-runner

RUN apt-get update -qqy && \
  apt-get install -qqy curl

COPY entrypoint.sh .
COPY install-multi-arch.sh .

ENV RUNNER_VERSION=$RUNNER_VERSION
RUN ./install-multi-arch.sh && ./bin/installdependencies.sh

RUN adduser --uid 1001 --gecos "" --home /actions-runner --disabled-login --disabled-password runner && \
  chown -R runner /actions-runner

USER runner

ENTRYPOINT ["/bin/bash"]
CMD ["entrypoint.sh"]
