FROM ubuntu:trusty
WORKDIR /var/www/
RUN sudo apt-get -y update -qq
RUN sudo apt-get install ssh vim curl -y
ADD client/logtailer.sh /var/www/
RUN chmod 755 logtailer.sh
RUN adduser --disabled-password --gecos '' test
RUN echo IP > /test.txt
CMD ["/bin/bash", "logtailer.sh"]
