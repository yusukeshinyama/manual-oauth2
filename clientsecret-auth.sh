#!/bin/sh
ENDPOINT='https://accounts.google.com/o/oauth2/v2/auth'
RESPONSE_TYPE='code'
SCOPE='openid%20email'
REDIRECT_URI='http%3A//localhost:8080'
if [ ! ${CLIENT_ID} ]; then 
  echo "CLIENT_ID not set"
  exit 1
fi

open "${ENDPOINT}?response_type=${RESPONSE_TYPE}&client_id=${CLIENT_ID}&scope=${SCOPE}&redirect_uri=${REDIRECT_URI}"
