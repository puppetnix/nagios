class nagios::agent($nagios_server="54.210.57.46") {
	include nagios::nrpe, nagios::monitor, nagios::nrpe_install
	}
