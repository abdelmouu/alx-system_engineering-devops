# Create a file in /tmp with specific permissions, owner, and content

file { '/tmp/school':
  # Set the file permissions
  mode    => '0744',
  # Set the file owner
  owner   => 'www-data',
  # Set the file group
  group   => 'www-data',
  # Set the file content
  content => 'I love Puppet',
}
