FROM gtcs2110/autograder-base:1.11.3

COPY build build
RUN chmod +x ./build/install-criterion.sh
RUN ./build/install-criterion.sh
RUN rm -rf build