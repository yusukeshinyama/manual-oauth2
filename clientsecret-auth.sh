#!/bin/sh
RESPONSE_TYPE='code'
SCOPE='openid%20email'
REDIRECT_URI='http%3A//localhost:8080'
if [ ! ${ENDPOINT_AUTH} ]; then
  echo "ENDPOINT_AUTH not set"
  exit 1
fi
if [ ! ${CLIENT_ID} ]; then
  echo "CLIENT_ID not set"
  exit 1
fi

open "${ENDPOINT_AUTH}?response_type=${RESPONSE_TYPE}&client_id=${CLIENT_ID}&scope=${SCOPE}&redirect_uri=${REDIRECT_URI}"
