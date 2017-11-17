#!/bin/bash

# Partner API
# Get Current User Profile

# Access token could be acquired from running pm2 log
echo 'This will return current user profile from exchange token.'
echo 'Please enter your Access Token (bearer abc)'
read access_token

curl -v -H "Authorization:$access_token" 'https://api-beta.bbm.blackberry.com:8443/v2/user/profile'