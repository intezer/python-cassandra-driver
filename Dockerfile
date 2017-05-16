ARG python_version
FROM python:$python_version
ARG driver_version
RUN apt-get update &&\
    apt-get install libev4 libev-dev
RUN pip install cassandra-driver==$driver_version