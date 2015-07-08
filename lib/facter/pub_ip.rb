Facter.add('pub_ip') do
	setcode do
	Facter::Util::Resolution.exec("/usr/bin/curl -s ipecho.net/plain")
	end
end
