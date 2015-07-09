class nagios::server {
	include nagios::nrpe_install
nagios_command  { 'resource title':
    command_name => 'check_nrpe',
    ensure       => 'present',
    command_line => '$USER1$/check_nrpe -H $HOSTADDRESS$ -c $ARG1$',
  }
  file_line { "nagios_command.cfg":
        line => "cfg_file=/etc/nagios/nagios_command.cfg",
        path => "/usr/local/nagios/etc/nagios.cfg",
        ensure => present,
        notify  => Service["nagios"],
   }
        file { 'nagios_command':
        ensure => present,
        mode => '0644',
        path => "/etc/nagios/nagios_command.cfg"
        }
    service { nagios:
        ensure => running,
        enable => true,
    }
    # collect resources and populate /etc/nagios/nagios_*.cfg
    Nagios_host <<||>>
    Nagios_service <<||>>
}
