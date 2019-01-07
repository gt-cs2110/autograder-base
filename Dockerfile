FROM gradescope/auto-builds:ubuntu-18.04

ENV CS2110_AUTOGRADER_VERSION 1.0.1

ENV AUTOGRADER_ROOT=/autograder \
    ZUCC_FILES=/zucc_files \
    DEBIAN_FRONTEND=noninteractive

ADD ./run_autograder $AUTOGRADER_ROOT/
ADD ./zucc_files/ /zucc_files

### Install zucchini and its dependencies
RUN cd $ZUCC_FILES && \
    apt-get update && \
    apt-get install -y python3 python3-pip python3-wheel cmake build-essential g++ castxml libglib2.0-dev libboost-all-dev python-pip && \
    pip3 install zucchini==0.3.0
    #pip3 install zucchini-0.3.0-py2.py3-none-any.whl
    #pip uninstall -y wheel && \
    #pip install scikit-build && \
    #pip install pyLC3 && \
    #ldconfig && \
    #pip install parameterized

RUN cd $AUTOGRADER_ROOT && mkdir source && mkdir results
RUN find $AUTOGRADER_ROOT -name 'run_autograder' -exec chmod a+x {} +
