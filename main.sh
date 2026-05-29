#!/bin/bash
# Burhan YAVAŞ
# 2420191018
# Docker Temelleri: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=ax1hrL07JO
# Siber Güvenlikte Linux: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=GoDfmP1KD9
# Linux Bash Script: https://www.techcareer.net/en/account/courses?tab=completed

date -Iseconds > report.log

wmic cpu get name >> report.log
wmic memorychip get capacity >> report.log
wmic baseboard get product,Manufacturer >> report.log
wmic csproduct get UUID >> report.log
wmic diskdrive get model,serialnumber,size >> report.log
getmac >> report.log

read -s -p "Lütfen parolayı girin: " PAROLA
echo ""

echo "$PAROLA" | gpg --batch --yes --passphrase-fd 0 --symmetric --cipher-algo AES256 -o report.log.gpg report.log

rm report.log