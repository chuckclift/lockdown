#!/usr/bin/env python3

# import subprocess
import socket
from time import sleep

servers = {
  "192.168.9.11":[22, 80, 443],
  "192.168.9.14":[22, 80],
  "192.168.9.15":[22, 80],
  "192.168.9.16":[22, 80],
  "192.168.9.18":[22, 80], 
  "192.168.9.10":[88, 3389, 445], 
  "192.168.9.12":[3389, 8080], 
  "192.168.9.13":[445, 3389, 8530], 
}

while True:
    for ip, portlist in servers.items():
        for port in portlist:
            try:
                s = socket.socket()
                s.connect((ip, port))
                s.close()
            except socket.error:
                print("Can't access", ip, "port:", port)
    sleep(10)
