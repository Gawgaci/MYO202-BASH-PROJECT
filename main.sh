#!/bin/bash
# Burhan YAVAŞ
# 2420191018
# Docker Temelleri: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=ax1hrL07JO
# Siber Güvenlikte Linux İşletim Sistemleri: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=GoDfmP1KD9
# Linux Bash Script: https://credsverse.com/credentials/8ad6c2c7-d9c7-4d88-bfb8-32582a3f3a22

date -Iseconds > report.log
wmic cpu get Manufacturer,Name >> report.log
wmic memorychip get Manufacturer,PartNumber,SerialNumber,Capacity >> report.log
wmic baseboard get Manufacturer,Product,SerialNumber >> report.log
wmic csproduct get UUID >> report.log
wmic diskdrive get Manufacturer,Model,SerialNumber,Size >> report.log
getmac >> report.log

read -s -p "Lütfen parolayı girin: " PAROLA
echo ""

gpg --batch --yes --passphrase "$PAROLA" --symmetric --cipher-algo AES256 --output report.log.gpg report.log

rm report.log