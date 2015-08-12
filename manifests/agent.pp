class nagios::agent($nagios_server="",$check_eth0=false) {
	include nagios::nrpe, nagios::monitor, nagios::nrpe_install
	}
