class nagios::monitor {

   @@nagios_host { $fqdn:
        ensure => present,
        alias => $hostname,
        address => $ec2_public_ipv4,
        use => "linux-server",
	check_command => check_ssh,
   }
#   @@nagios_service { "check_ping_${hostname}":
 #       check_command => "check_ping!100.0,30%!500.0,60%",
  #      use => "generic-service",
   #     host_name => "$fqdn",
    #    notification_period => "24x7",
     #   service_description => "${hostname}_check_ping",
#	notify => Service[nagios],
 #  }
}
