# Kills a process named 'killmenow' using Puppet

exec {
    'pkill':
    command => '/usr/bin/pkill killmenow',
}
