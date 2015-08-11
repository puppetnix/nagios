class nagios::server {
	Class['nagios::nrpe_command'] ~> Class['nagios::server']
	include nagios::nrpe_command
    service { nagios:
        ensure => running,
        enable => true,
    }
    # collect resources and populate /etc/nagios/nagios_*.cfg
    Nagios_host <<||>>
    Nagios_service <<||>>
}
