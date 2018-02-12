iptables -A OUTPUT -d ! 192.168.200.104 -m state --state NEW  -j LOG 
