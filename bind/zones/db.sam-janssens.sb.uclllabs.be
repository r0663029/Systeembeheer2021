$TTL	604800
@	IN	SOA	ns.sam-janssens.sb.uclllabs.be. root.ns.sam-janssens.sb.uclllabs.be. (
28; Serial
			 604800		; Refresh
			  86400		; Retry
			2420200		; Expire
			 604800 )	; Negative Cache TTL
;Name Servers
@               IN      NS      ns1.uclllabs.be.
@               IN      NS      ns2.uclllabs.be.
@               IN      NS      ns.sam-janssens.sb.uclllabs.be.

;CAA for let's encrypt
secure.sam-janssens.sb.uclllabs.be.		 CAA	 1 issue "letsencrypt.org"
secure.sam-janssens.sb.uclllabs.be.		 CAA	 1 iodef "mailto:root@sam-janssens.sb.uclllabs.be"
supersecure.sam-janssens.sb.uclllabs.be.         CAA     1 issue "letsencrypt.org"
supersecure.sam-janssens.sb.uclllabs.be.         CAA     1 iodef "mailto:root@sam-janssens.sb.uclllabs.be"

;Aliasses
@		IN	A	193.191.177.204
ns		IN	A	193.191.177.204
www		IN	A	193.191.177.204
www1		IN	A	193.191.177.204
www2            IN      A       193.191.177.204
test 		IN	A	193.191.177.254
kom		IN	A	193.191.177.204
supersecure     IN      A       193.191.177.204
secure          IN      A       193.191.177.204
subzoneahher5		IN	NS	ns.sam-janssens.sb.uclllabs.be.
