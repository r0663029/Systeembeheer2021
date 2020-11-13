#!/bin/bash

domain=$1
mydate=`date +%Y%m%d`

echo -e "\$TTL 604800
@	IN	SOA	ns.$domain.sam-janssens.sb.uclllabs.be. root.$domain.sam-janssens.sb.uclllabs.be.(
			$mydate"1"	; Serial
			604800		; Refresh
			600		; Retry
			600		; Expire
			604800)		; Negative Cache TTl
;
@	IN	NS	ns.$domain.sam-janssens.sb.uclllabs.be.
@	IN	NS	ns.sam-janssens.sb.uclllabs.be.
ns	IN	A	193.191.177.204
@	IN	A	193.191.177.204 " > /etc/bind/zones/db.ns.$domain.sam-janssens.sb.uclllabs.be

echo "Add zone"
echo -e "zone \"$domain.sam-janssens.sb.uclllabs.be\" {
	type master;
	file \"/etc/bind/zones/db.$domain.sam-janssens.sb.uclllabs.be\";
	notify yes;
};
" >> /etc/bind/named.conf.local

echo -e "$domain	IN	NS	ns.sam-janssens.sb.uclllabs.be." >> /etc/bind/zones/db.ns.sam-janssens.sb.uclllabs.be

serialline=$(grep "Serial" /etc/bind/zones/db.ns.sam-janssens.sb.uclllabs.be)
serialnumber=$(echo $serialline | cut -d \; -f 1)
((serialnumber++))
newserial="$serialnumber	; Serial"
echo $newserial;
sed -i "s/.*Serial.*/\t\t\t	$newserial/g" /etc/bind/zones/db.ns.sam-janssens.sb.uclllabs.be
echo -e "serial updated, restarting bind9"

systemctl restart bind9

echo "Done."
