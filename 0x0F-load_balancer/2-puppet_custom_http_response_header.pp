# Configure custom HTTP header for Nginx
class nginx_custom_header {
  $hostname = $::hostname

  file { '/etc/nginx/conf.d/custom_header.conf':
    ensure  => present,
    content => "add_header X-Served-By ${hostname};",
    notify  => Service['nginx'],
  }

  service { 'nginx':
    ensure => running,
    enable => true,
  }
}

include nginx_custom_header
