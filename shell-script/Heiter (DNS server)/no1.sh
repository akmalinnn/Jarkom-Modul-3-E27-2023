echo 'zone "riegel.canyon.e27.com" {
    type master;
    file "/etc/bind/sites/riegel.canyon.e27.com";
};

zone "granz.channel.e27.com" {
    type master;
    file "/etc/bind/sites/granz.channel.e27.com";
};

zone "1.50.10.in-addr.arpa" {
    type master;
    file "/etc/bind/sites/1.50.10.in-addr.arpa";
};' > /etc/bind/named.conf.local

mkdir -p /etc/bind/sites
cp /etc/bind/db.local /etc/bind/sites/riegel.canyon.e27.com
cp /etc/bind/db.local /etc/bind/sites/granz.channel.e27.com
cp /etc/bind/db.local /etc/bind/sites/1.50.10.in-addr.arpa

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.e27.com. root.riegel.canyon.e27.com. (
                        202311001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      riegel.canyon.e27.com.
@       IN      A       10.50.4.1     ; IP Fern
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
@       IN      A       10.50.3.1     ; IP Lugner
www     IN      CNAME   granz.channel.e27.com.' > /etc/bind/sites/granz.channel.e27.com

echo 'options {
      directory "/var/cache/bind";

      forwarders {
              192.168.122.1;
      };

      // dnssec-validation auto;
      allow-query{any;};
      auth-nxdomain no;    # conform to RFC1035
      listen-on-v6 { any; };
}; ' >/etc/bind/named.conf.options

service bind9 start