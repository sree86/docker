FROM ubuntu:trusty
WORKDIR /tmp
RUN apt-get update -qq
RUN apt-get install inotify-tools build-essential curl supervisor apache2 php5 libapache2-mod-php5 php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl wget zip unzip vim ssh -y
RUN mv /etc/ssh/ssh_config /etc/ssh/ssh_config_bak
ADD files/ssh_config /etc/ssh/ssh_config
RUN service ssh restart
RUN apt-get update -qq
ADD files/startup.sh .
RUN ./startup.sh
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN curl https://ossec.wazuh.com/repos/apt/conf/ossec-key.gpg.key -o ossec-key.gpg.key &&\
  apt-key add ossec-key.gpg.key && rm -v ossec-key.gpg.key &&\
  echo "deb http://ossec.wazuh.com/repos/apt/ubuntu trusty main" >> /etc/apt/sources.list &&\
  apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -yf install expect ossec-hids \
  ossec-hids=2.8.3-4trusty
RUN mkdir -p /var/www/ossec/tmp
ADD files/ossec-wui-master /var/www/ossec
RUN chown www-data:www-data /var/www/ossec/tmp/
RUN usermod www-data -G ossec
RUN chmod 666 /var/www/ossec/tmp
ADD files/ossec.conf /var/ossec/etc/
ADD files/sslmanager.cert /var/ossec/etc/
ADD files/sslmanager.key /var/ossec/etc/
ADD files/htpasswd_ossec /etc/apache2/.htpasswd_ossec
RUN a2ensite ossec.domain
RUN sed -i "s/HOSTNAME/`hostname`/g" /var/ossec/etc/ossec.conf
RUN /var/ossec/bin/ossec-control enable database
VOLUME ["/var/ossec"]
EXPOSE 1514/udp 1515/tcp 80
