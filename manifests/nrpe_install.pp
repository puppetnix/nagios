class nagios::nrpe_install inherits nagios::params {
	package { [$nrpe_type, 'nagios-plugins']:
		ensure => installed,
	}
	service { "$::nagios::params::nrpe_type":
		ensure => running,
		enable => true,
		require => Package[$::nagios::params::nrpe_type],
	}
	
	file { '/usr/lib/nagios/plugins/check_bandwidth':
		ensure => present,
		mode => "0755",
		require => Service[$::nagios::params::nrpe_type],
		content => file('nagios/check_bandwidth'),
	}
	file { '/usr/lib/nagios/plugins/check_cpu':
		ensure => present,
		content => file('nagios/check_cpu'),
		require => Service[$::nagios::params::nrpe_type],
		mode => "0755",
	}
	file { '/usr/lib/nagios/plugins/check_mem':
		ensure => present,
		content => file('nagios/check_mem'),
		require => Service[$::nagios::params::nrpe_type],
		mode => "0755",
	}
	package { ['facter','puppet']:
	ensure => latest,
}
}
