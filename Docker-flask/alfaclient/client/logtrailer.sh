#!/bin/bash
host=`hostname`
echo $host
service ssh restart;
service rsyslog restart;
echo "test:123" | chpasswd
tail -F /var/log/auth.log | while read -r line
do
        if echo ${line} | grep -E 'Accepted publickey| Accepted password'; then
                curl -i -H "Content-Type: application/json" -X POST -d '{"userId":"1", "username": "'"$host"'" }' http://localhost/clients

        fi
done

