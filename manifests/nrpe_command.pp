class nagios::nrpe_command {
nagios_command  { 'resource title':
    command_name => 'check_nrpe',
    ensure       => 'present',
    command_line => '$USER1$/check_nrpe -H $HOSTADDRESS$ -c $ARG1$ -t 30',
  }
  file_line { "nagios_command.cfg":
        line => "cfg_file=/etc/nagios/nagios_command.cfg",
        path => "/usr/local/nagios/etc/nagios.cfg",
        ensure => present,
        notify  => Service["nagios"],
   }
	file { 'nagios_command':
	ensure => present,
	mode => '0644',
	path => "/etc/nagios/nagios_command.cfg",
	require => File['/etc/nagios/'],
	}
 file_line { "add nagios":
	line => "cfg_file=/etc/nagios/nagios_host.cfg",
	path => "/usr/local/nagios/etc/nagios.cfg",
	ensure => present,
	notify => Service["nagios"],
	}
 file_line { "add nagios1":
        line => "cfg_file=/etc/nagios/nagios_service.cfg",
        path => "/usr/local/nagios/etc/nagios.cfg",
        ensure => present,
        notify => Service["nagios"],
        } 
 file { ['/etc/nagios/nagios_host.cfg', '/etc/nagios/nagios_service.cfg']:
	mode => '0644',
	ensure => present,
	require => File['/etc/nagios/'],
}
	file { '/etc/nagios/':
		ensure => directory,
	}

}
