class nagios::nrpe {
file_line { "allowed_hosts":
        line => "allowed_hosts = 127.0.0.1,${nagios_server}",
        path => "/etc/nagios/nrpe.cfg",
        match => "allowed_hosts",
        ensure => present,
	notify => Service['nagios-nrpe-server'],
   }
file { "/etc/nagios/nrpe_local.cfg":
	ensure => present,
	content => template("nagios/nrpe_local.cfg.erb"),
        notify => Service['nagios-nrpe-server'],
	}
file_line { "enable config":
	line => "include=/etc/nagios/nrpe_local.cfg",
	ensure => present,
	path => "/etc/nagios/nrpe.cfg",
	notify => Service['nagios-nrpe-server'],
	}
   @@nagios_service { "check_load_${hostname}":
        check_command => "check_nrpe!check_load",
        use => "generic-service",
        host_name => "$fqdn",
        service_description => "${hostname}_check_load"
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

}
