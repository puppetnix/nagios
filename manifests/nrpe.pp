class nagios::nrpe inherits nagios::agent  {
file_line { "allowed_hosts":
        line => "allowed_hosts = 127.0.0.1,${::nagios::agent::nagios_server}",
        path => "/etc/nagios/nrpe.cfg",
        match => "allowed_hosts",
        ensure => present,
	notify => Service['nagios-nrpe-server'],
	require => Package['nagios-nrpe-server'],
  }
file { "/etc/nagios/nrpe_local.cfg":
	ensure => present,
	content => template("nagios/nrpe_local.cfg"),
        notify => Service['nagios-nrpe-server'],
	require => Package['nagios-nrpe-server'],
	}
file_line { "enable config":
	line => "include=/etc/nagios/nrpe_local.cfg",
	ensure => present,
	path => "/etc/nagios/nrpe.cfg",
	notify => Service['nagios-nrpe-server'],
	require => Package['nagios-nrpe-server'],
	}
   @@nagios_service { "check_load_${hostname}":
        check_command => "check_nrpe!check_load",
        use => "generic-service",
        host_name => "$fqdn",
        service_description => "${hostname}_check_load",
   }
   @@nagios_service { "check_total_procs_${hostname}":
        check_command => "check_nrpe!check_total_procs",
        use => "generic-service",
        host_name => "$fqdn",
        service_description => "${hostname}_check_total_procs"
   }
   @@nagios_service { "check_zombie_procs_${hostname}":
        check_command => "check_nrpe!check_zombie_procs",
        use => "generic-service",
        host_name => "$fqdn",
        service_description => "${hostname}_check_zombie_procs"
   }
   @@nagios_service { "check_users_${hostname}":
        check_command => "check_nrpe!check_users",
        use => "generic-service",
        host_name => "$fqdn",
        service_description => "${hostname}_check_users"
   }
   @@nagios_service { "Check disk ${hostname}":
	check_command => "check_nrpe!check_xvda1",
	use => "generic-service",
	host_name => "$fqdn",
	service_description => "${hostname} Check disk",
	notify => Service[nagios],
   }
   @@nagios_service { "Check updates ${hostname}":
        check_command => "check_nrpe!check_apt",
        use => "generic-service",
        host_name => "$fqdn",
        service_description => "${hostname} Check updates",
        notify => Service[nagios],
   }
  @@nagios_service { "Check CPU load ${hostname}":
	check_command => "check_nrpe!check_cpu",
	use => "generic-service",
	host_name => "$fqdn",
	service_description => "${hostname} Check CPU load",
	notify => Service[nagios],
  }
  @@nagios_service { "Check Memory load ${hostname}":
        check_command => "check_nrpe!check_mem",
        use => "generic-service",
        host_name => "$fqdn",
        service_description => "${hostname} Check Memory load",
        notify => Service[nagios],
  }
  @@nagios_service { "Check eth0 stats ${hostname}":
		check_command => "check_nrpe!check_eth0",
		use => "generic-service",
		host_name => "$fqdn",
		service_description => "${hostname} Check eth0 stats",
		notify => Service[nagios],
	}
  @@nagios_service { "Check loopback stats ${hostname}":
	check_command => "check_nrpe!check_loop",
	use => "generic-service",
	host_name => "$fqdn",
	service_description => "${hostname} Check lo stats",
	notify => Service[nagios],
	}
  @@nagios_service { "Check SSH ${hostname}":
	check_command => "check_ssh",
	use => "generic-service",
	host_name => "$fqdn",
	service_description => "${hostname} SSH check",
	notify => Service[nagios],
       }
  @@nagios_service { "Check NTP ${hostname}":
	check_command => "check_nrpe!check_ntp",
	use => "generic-service",
	host_name => "$fqdn",
	service_description => "${hostname} NTP check",
	notify => Service[nagios],
	}
}
