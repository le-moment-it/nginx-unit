#!/bin/bash

# ./renew.sh <name_of_nginx_unit_listener>

# curl --request PUT --data-binary \"unit.stream.vasseurlaurent.com\" --unix-socket /var/run/control.unit.sock http://localhost/config/listeners/*:443/tls/certificate
for certificate in $(ls -d /etc/letsencrypt/live/*/ | xargs -n 1 basename); do
    cat /etc/letsencrypt/live/$certificate/fullchain.pem /etc/letsencrypt/live/$certificate/privkey.pem > /tmp/$certificate.pem
    
    # Upload temporary certificate on name tmp-<certificate>
    curl -X PUT --data-binary @/tmp/$certificate.pem --unix-socket /var/run/control.unit.sock http://localhost/config "http://localhost/certificates/tmp-$certificate" 2> /dev/null
    curl -X PUT --data-binary \"tmp-$certificate\" --unix-socket /var/run/control.unit.sock "http://localhost/config/listeners/$1/tls/certificate"

    # Delete previous certificate
    curl -X DELETE --unix-socket /var/run/control.unit.sock "http://localhost/certificates/$certificate"  2> /dev/null
    
    # Upload new certificate on name <certificate>
    curl -X PUT --data-binary @/tmp/$certificate.pem --unix-socket /var/run/control.unit.sock http://localhost/config "http://localhost/certificates/$certificate" 2> /dev/null
    curl -X PUT --data-binary \"$certificate\" --unix-socket /var/run/control.unit.sock "http://localhost/config/listeners/$1/tls/certificate"
    
    # Remove temporary certificate
    curl -X DELETE --unix-socket /var/run/control.unit.sock "http://localhost/certificates/tmp-$certificate"  2> /dev/null

done