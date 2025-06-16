#!/bin/sh
GRANT_TYPE='authorization_code'
SCOPE='openid%20email'
REDIRECT_URI='http%3A//localhost:8080'
if [ ! ${ENDPOINT_TOKEN} ]; then
  echo "ENDPOINT_TOKEN not set"
  exit 1
fi
if [ ! ${CLIENT_ID} ]; then
  echo "CLIENT_ID not set"
  exit 1
fi
if [ ! ${CODE_VERIFIER} ]; then
  echo "CODE_VERIFIER not set"
  exit 1
fi
CODE=$1
if [ ! ${CODE} ]; then
  echo "usage: $0 code"
  exit 1
fi

curl -d "code=${CODE}&client_id=${CLIENT_ID}&code_verifier=${CODE_VERIFIER}&redirect_uri=${REDIRECT_URI}&grant_type=${GRANT_TYPE}" "${ENDPOINT_TOKEN}"
