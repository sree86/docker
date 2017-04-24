FROM ubuntu:14.04
MAINTAINER sreejith "psreejithp007@gmail.com"
ENV REFRESHED_AT 2014-06-01

RUN rsyslogd
RUN mkdir -p /var/lib/db
WORKDIR /var/lib/db
RUN sudo apt-get update -qq
RUN sudo apt-get install -y sqlite3 libsqlite3-dev ssh
RUN /usr/bin/sqlite3 reports.db
ADD sqlite/schema.sql .
RUN sqlite3 reports.db < schema.sql
CMD /bin/bash

RUN apt-get update -qq
RUN apt-get install -y python-pip
RUN pip install flask
RUN mkdir -p /var/www/
WORKDIR /var/www/
ADD server/server-web.py /var/www/
RUN mkdir /var/www/templates
ADD server/templates/list.html /var/www/templates/
ENTRYPOINT ["python"]
CMD ["server-web.py"]
EXPOSE 80

