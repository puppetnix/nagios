class nagios::server {
	include nagios::nrpe_install, nagios::nrpe-command
    service { nagios:
        ensure => running,
        enable => true,
    }
    # collect resources and populate /etc/nagios/nagios_*.cfg
    Nagios_host <<||>>
    Nagios_service <<||>>
}
