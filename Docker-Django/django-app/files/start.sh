#!/bin/bash
cd /var/www/project
django-admin.py startproject firstsite
echo "STATIC_ROOT = os.path.join(BASE_DIR, \"static/\")" >> /var/www/project/firstsite/firstsite/settings.py
cd /var/www/project/firstsite 
./manage.py migrate
./manage.py collectstatic
sed -i "s/ALLOWED_HOSTS \= \[\]/ALLOWED_HOSTS = \[\'firstsite.com\'\]/g" /var/www/project/firstsite/firstsite/settings.py
echo "test:123" | chpasswd

# Iptables 

#iptables -I INPUT 1 -p tcp --dport 443 -j ACCEPT
#iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT

#iptables -A INPUT -p tcp --sport 21 -m state --state ESTABLISHED -j ACCEPT
#iptables -A OUTPUT -p tcp --dport 21 -m state --state NEW,ESTABLISHED -j ACCEPT

#iptables -A INPUT -p tcp --sport 65000: --dport 65000: -m state --state ESTABLISHED -j ACCEPT
#iptables -A OUTPUT -p tcp --sport 65000: --dport 65000: -m state --state ESTABLISHED,RELATED -j ACCEPT
