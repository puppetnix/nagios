class nagios::nrpe {
file_line { "allowed_hosts":
        line => "allowed_hosts = 127.0.0.1,10.169.46.122",
        path => "/etc/nagios/nrpe.cfg",
        match => "allowed_hosts",
        ensure => present,
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
   @@nagios_service { "Check update ${hostname}":
	check__command => "check_nrpe!check_apt_nrpe",
	use => "generic-service",
	host_name => "$fqdn",
	service_description => "${hostname} Check update",
   }
}
