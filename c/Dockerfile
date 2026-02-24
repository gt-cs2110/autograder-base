ARG IMAGE_VERSION=latest
FROM ghcr.io/gt-cs2110/autograder-base:${IMAGE_VERSION}

COPY build build

RUN chmod +x ./build/install-criterion.sh
RUN ./build/install-criterion.sh

RUN apt-get install -y valgrind

RUN rm -rf build