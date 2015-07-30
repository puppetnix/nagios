class nagios::agent($nagios_server="") {
	include nagios::nrpe, nagios::monitor, nagios::nrpe_install
	}
