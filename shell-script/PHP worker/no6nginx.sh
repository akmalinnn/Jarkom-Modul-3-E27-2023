cp /etc/nginx/sites-available/default /etc/nginx/sites-available/granz.channel.e27.com
ln -s /etc/nginx/sites-available/granz.channel.e27.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default