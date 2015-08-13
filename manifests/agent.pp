class nagios::agent($nagios_server="54.153.28.163",$check_eth0=false) {
	include nagios::nrpe, nagios::monitor, nagios::nrpe_install
	}
