class nagios::nrpe_install {
	package { ['nagios-nrpe-server', 'nagios-plugins']:
		ensure => installed,
	}
	service { 'nagios-nrpe-server':
		ensure => running,
		enable => true,
		require => Package['nagios-nrpe-server'],
	}
	file { '/usr/lib/nagios/plugins/check_bandwidth':
		content  => template('nagios/check_bandwidth'),
		mode => "0777",
	}
	file { '/usr/lib/nagios/plugins/check_cpu':
		content => template('nagios/check_cpu'),
		mode => "0755",
	}
	file { '/usr/lib/nagios/plugins/check_mem':
		content => template('nagios/check_mem'),
		mode => "0755",
	}
}
