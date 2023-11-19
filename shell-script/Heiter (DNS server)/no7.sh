echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.e27.com. root.riegel.canyon.e27.com. (
                        2023110401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      riegel.canyon.e27.com.
@       IN      A       10.50.2.2     ; IP Eisen
www     IN      CNAME   riegel.canyon.e27.com.' > /etc/bind/sites/riegel.canyon.e27.com



echo '
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     granz.channel.e27.com. root.granz.channel.e27.com. (
                        2023110401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      granz.channel.e27.com.
@       IN      A       10.50.2.2     ; IP Eisen
www     IN      CNAME   granz.channel.e27.com.' > /etc/bind/sites/granz.channel.e27.com