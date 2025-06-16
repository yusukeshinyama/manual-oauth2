#!/bin/sh
ENDPOINT='https://accounts.google.com/o/oauth2/v2/auth'
RESPONSE_TYPE='code'
SCOPE='openid%20email'
CODE_CHALLENGE_METHOD='S256'
REDIRECT_URI='http%3A//localhost:8080'
if [ ! ${CLIENT_ID} ]; then
  echo "CLIENT_ID not set"
  exit 1
fi
if [ ! ${CODE_CHALLENGE} ]; then
  echo "CODE_CHALLENGE not set"
  exit 1
fi

open "${ENDPOINT}?response_type=${RESPONSE_TYPE}&client_id=${CLIENT_ID}&scope=${SCOPE}&redirect_uri=${REDIRECT_URI}&code_challenge=${CODE_CHALLENGE}&code_challenge_method=${CODE_CHALLENGE_METHOD}"
