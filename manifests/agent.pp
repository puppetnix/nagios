class nagios::agent($nagios_server="",$check_disk=true)  {
	include nagios::nrpe, nagios::monitor, nagios::nrpe_install
	}
