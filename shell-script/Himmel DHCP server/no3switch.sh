echo 'subnet 10.50.1.0 netmask 255.255.255.0 {
}

subnet 10.50.2.0 netmask 255.255.255.0 {
}

subnet 10.50.3.0 netmask 255.255.255.0 {
    range 10.50.3.16 10.50.3.32;
    range 10.50.3.64 10.50.3.80;
    option routers 10.50.3.0;
}

subnet 10.50.4.0 netmask 255.255.255.0 {
    range 10.50.4.12 10.50.4.20;
    range 10.50.4.160 10.50.4.168;
    option routers 10.50.4.0;
} ' > /etc/dhcp/dhcpd.conf