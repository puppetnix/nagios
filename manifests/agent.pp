class nagios::agent($nagios_server="54.197.94.135") {
	include nagios::nrpe, nagios::monitor, nagios::nrpe_install
	}
