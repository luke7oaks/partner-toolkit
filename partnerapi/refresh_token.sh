#!/bin/bash

printf 'Partner API\n'
printf 'Refresh token\n'
# ./exchange-token.sh <client-id> <client-secreet> <access-token>

printf 'This will get new token.\n'
printf 'Please enter clientId\n'
read clientID
printf 'Please enter clientSecreet\n'
read clientSecreet
# translate to base64
combined=$clientID:$clientSecreet
baseEncoded64=`printf $combined | base64 | tr -d '[:space:]'`
printf 'below is your base64\n'
printf $baseEncoded64

printf '\nPlease enter refresh_token that\n'
read refreshToken
printf '\nPlease enter path to your Private Key file (.key)\n'
printf 'Example /app/demo-server/ssl/yourkey.key\n'
read key
printf '\nPlease enter path to your Cert file (.crt)\n'
printf 'Example /app/demo-server/ssl/yourkey.crt\n'
read crt
printf 'Enter the token server URL'
printf 'Example https://auth-str.eval.blackberry.com:8443'
read URL
# https://auth-beta.bbm.blackberry.com:8443
# https://auth-str.eval.blackberry.com:8443
# https://auth2.bbm.blackberry.com
curl -v --cert $crt --key $key -H "Content-Type:application/x-www-form-urlencoded" -H "Accept: application/json" -H "Authorization: Basic $baseEncoded64" -d "grant_type=refresh_token&refresh_token=$refreshToken" "$URL/oauth/token"
