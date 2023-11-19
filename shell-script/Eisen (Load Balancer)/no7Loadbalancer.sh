cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo ' upstream worker {
    server 10.50.3.1;
    server 10.50.3.2;
    server 10.50.3.3;
}

server {
    listen 80;
    server_name granz.channel.e27.com www.granz.channel.e27.com;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;
    server_name _;

    location / {
        proxy_pass http://worker;
    }
} ' > /etc/nginx/sites-available/lb_php

ln -s /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default
service nginx restart

# ab -n 1000 -c 100 http://www.granz.channel.e27.com/ 
# ab -n 200 -c 10 http://www.granz.channel.e27.com/ 
# ab -n 100 -c 10 http://www.granz.channel.e27.com/ 