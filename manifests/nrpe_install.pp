class nagios::nrpe_install {
	package { ['nagios-nrpe-server', 'nagios-plugins']:
		ensure => installed,
	}
	service { 'nagios-nrpe-server':
		ensure => running,
		enable => true,
		require => Package['nagios-nrpe-server'],
	}
}
