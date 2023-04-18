#!/bin/bash
#Znajdz w pliku access_log unikalne zapytania typu DELETE
grep "DELETE" access_log | sort | uniq

#Znajdz w pliku access_log zapytania ktore maja fraze 'denied' w linku
awk '{print $7}' access_log | grep "denied"

#Znajdz w pliku access_log zapytania wysslane z IP:64.242.88.10
grep "^64\.242\.88\.10\s" access_log

#Znajdz w pliku access_log wszystkie zapytania niewyslane z adresu ip tylko z FQDN
grep -v '^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' access_log 