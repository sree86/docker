FROM ubuntu:14.04
MAINTAINER Sreejith
RUN sudo apt-get -y update -qq
RUN sudo apt-get install mysql-client mysql-server supervisor -y
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
ADD sqls/grants.sql /tmp/
ADD sqls/schema.sql /tmp/
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN /bin/bash -c "/usr/bin/mysqld_safe &" && \
  sleep 5 && \
  mysql -u root -e "CREATE DATABASE ossecdb;" && \
  mysql -u root ossecdb < /tmp/schema.sql && \
  mysql -u root < /tmp/grants.sql && \
  killall mysqld && \
  sleep 10s
VOLUME ["/var/lib/mysql"]
RUN rm -v /tmp/*.sql
CMD ["/usr/bin/supervisord"]
EXPOSE 3306
