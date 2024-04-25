# Install Flask version 2.1.0 from pip3
#

package {
    'python3.8':
    ensure  => '3.8.10',
}

package {
    'python3-pip':
    ensure  => installed,
}

package {
    'flask':
    ensure   => '2.1.0',
    require  => Package['python3-pip'],
    provider => 'pip',
}

package {
    'Werkzeug':
    ensure   => '2.2.2',
    require  => Package['python3-pip'],
    provider => 'pip',
}
