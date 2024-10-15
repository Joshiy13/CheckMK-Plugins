#!/bin/bash
#This is a CheckMK Plugin to display the Paloalto Firewall Advanced Threat Protection License Expiration Date.

#Firewall API Key
API_KEY="YOUR_API_KEY_HERE"

#Firewall IP Address
FIREWALL_ADDRESS="FIREWALL_IP_ADDRESS_HERE"

RESPONSE=$(curl -k -s "https://$FIREWALL_ADDRESS/api/?type=op&cmd=%3Crequest%3E%3Clicense%3E%3Cinfo%3E%3C/info%3E%3C/license%3E%3C/request%3E&key=$API_KEY")

EXPIRATION_DATE=$(echo $RESPONSE | awk 'BEGIN {RS="<entry>"; FS="<expires>|</expires>"} /<feature>Advanced Threat Prevention<\/feature>/ {print $2}' | head -1)

TODAY=$(date +%s)
EXPIRATION_DATE_SEC=$(date -d "$EXPIRATION_DATE" +%s)
DIFF_SEC=$((EXPIRATION_DATE_SEC-TODAY))

if [ "$DIFF_SEC" -le 0 ]; then
    echo "License is expired. Please renew!"
    exit 2
else
    DAYS_LEFT=$((DIFF_SEC/86400))
    # Check if the license is expiring soon
    if [ "$DAYS_LEFT" -le 60 ]; then
        echo "License expires in $DAYS_LEFT days. Please renew!"
        exit 2
    else
        echo "License expires in $DAYS_LEFT days."
        exit 0
    fi
fi
