#!/bin/bash

iptables -I INPUT 1 -p tcp --dport 443 -j ACCEPT
iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT

iptables -A INPUT -p tcp --sport 21 -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 21 -m state --state NEW,ESTABLISHED -j ACCEPT

iptables -A INPUT -p tcp --sport 65000: --dport 65000: -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 65000: --dport 65000: -m state --state ESTABLISHED,RELATED -j ACCEPT



