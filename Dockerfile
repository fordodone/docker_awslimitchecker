FROM ubuntu:16.04
MAINTAINER fordodone@gmail.com

COPY credentials /root/.aws/credentials
COPY config /root/.aws/config

RUN apt-get update && apt-get install -y python-pip python-setuptools 
RUN pip install virtualenv
RUN cd /usr/local/src && virtualenv limitchecker 
RUN bash -c "cd /usr/local/src && source limitchecker/bin/activate && pip install awslimitchecker"

CMD /usr/local/src/limitchecker/bin/awslimitchecker
