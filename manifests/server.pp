class nagios::server {
	include nagios::nrpe_command, nagios::nrpe_install
    service { nagios:
        ensure => running,
        enable => true,
    }
    # collect resources and populate /etc/nagios/nagios_*.cfg
    Nagios_host <<||>>
    Nagios_service <<||>>
}
