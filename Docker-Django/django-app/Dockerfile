FROM ubuntu:trusty
WORKDIR /var/www/project
RUN apt-get update -qq
RUN apt-get install nginx python-pip python-dev vim supervisor ssh ftp vsftpd iptables -y
RUN mkdir -p /var/www/project /var/run/vsftpd/empty
RUN cd /var/www/project
RUN pip install virtualenv virtualenvwrapper
RUN adduser --disabled-password --gecos '' test

RUN pip install django gunicorn
RUN cd /var/www/project
ADD files/start.sh /tmp/
RUN /tmp/./start.sh
RUN cd /var/www/project/firstsite

ADD files/django_site_nginx.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/django_site_nginx.conf /etc/nginx/sites-enabled

RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
WORKDIR /var/www/project/firstsite

ADD files/vsftpd.conf /etc/vsftpd.conf
EXPOSE 80 443
EXPOSE 21
CMD ["/usr/bin/supervisord"]

ADD files/iptables_rules.txt /tmp/
#RUN iptables-restore < /tmp/iptables_rules.txt
