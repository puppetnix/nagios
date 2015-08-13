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
		ensure => present,
		mode => "0777",
		content => file('nagios/check_bandwidth'),
	}
	file { '/usr/lib/nagios/plugins/check_cpu':
		ensure => present,
		content => file('nagios/check_cpu'),
		mode => "0755",
	}
	file { '/usr/lib/nagios/plugins/check_mem':
		ensure => present,
		content => file('nagios/check_mem'),
		mode => "0755",
	}
	package { 'facter':
	ensure => latest,
}
}
