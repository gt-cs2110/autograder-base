FROM gradescope/autograder-base:ubuntu-22.04

ENV CS2110_AUTOGRADER_VERSION=1.11.2

ENV AUTOGRADER_ROOT=/autograder \
    DEBIAN_FRONTEND=noninteractive

ADD ./run_autograder $AUTOGRADER_ROOT/

### Install zucchini and its dependencies
RUN apt-get update && \
    apt-get install -y python3 python-is-python3 python3-pip cmake build-essential g++ castxml tmux && \
    pip3 install zucchini==2.2.14

RUN cd $AUTOGRADER_ROOT && mkdir source && mkdir results

### Local autograder dependencies
ADD ./run_local $AUTOGRADER_ROOT/
ADD ./print_grades.py $AUTOGRADER_ROOT/source/
RUN pip3 install unidecode pyyaml


RUN find $AUTOGRADER_ROOT -name 'run*' -exec chmod a+x {} +
