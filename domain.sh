#!/bin/bash

read -p "Please enter a domain (like google.com): " target_domain

echo "Target domain is: $target_domain"

echo "Found subdomains:"
curl -s https://crt.sh/\?q\=${target_domain}\&output\=json | jq . | grep name | cut -d":" -f2 | grep -v "CN=" | cut -d'"' -f2 | sed -e 's/\\n/\n/g' | grep '\.' | sort -u | tee ${target_domain}_subdomainlist.txt


echo "Found subdomains with associated IPs (may take a few seconds to populate):"
for i in $(cat ${target_domain}_subdomainlist.txt);do host $i | grep "has address" | grep ${target_domain} | cut -d" " -f1,4;done | tee ${target_domain}_subdomainips.txt

echo "Results from Shodan for IPs:"
for ip in $(awk '{print $2}' "${target_domain}_subdomainips.txt"); do shodan host "$ip"; sleep 1; done | tee "${target_domain}_shodanresults.txt"
