#!/bin/bash

# network interface which can connect to local network
IF=enp1s0
# interface VPN tunnel uses
# for the case of this example like specifying [tun] on the config, generally this param is [tun0]
VPNIF=tun0

echo 0 > /proc/sys/net/ipv4/ip_forward
iptables -D FORWARD -i  ${VPNIF} -j ACCEPT
iptables -t nat -D POSTROUTING -o ${IF} -j MASQUERADE
