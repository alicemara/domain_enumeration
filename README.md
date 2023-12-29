# domain_enumeration
Exactly what it says. Read the script before you run it. 

Quick and dirty script made when doing HTB. Can't say it's perfect but it seems to work (mostly)!

What it does:

1) Asks you for a domain to enumerate

2) Uses https://crt.sh/ to search certs, makes a list of unique names, spits out a .txt file with the list

3) Creates a list of the domains with associated IPs, and makes a .txt file of them

4) Looks up that list with IPs on shodan and makes (yes another) .txt file with results
