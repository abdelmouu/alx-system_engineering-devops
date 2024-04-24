# Install Nginx
package { 'nginx':
  ensure => installed,
}

# Configure Nginx
file { '/var/www/html/index.html':
  content => 'Hello World!',
  require => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
  content => "server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html;
    index index.html index.htm;

    location / {
      try_files \$uri \$uri/ =404;
    }

    rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;

    error_page 404 /404.html;
    location = /404.html {
      internal;
    }
  }",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Start and enable Nginx
service { 'nginx':
  ensure => running,
  enable => true,
}
