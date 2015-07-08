class nagios::monitor($ip_type=ec2_public_ipv4) {

   @@nagios_host { $fqdn:
        ensure => present,
        alias => $hostname,
        address => $ip_type,
        use => "linux-server",
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
