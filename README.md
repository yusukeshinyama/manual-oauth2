# manual-auth

## Preparation

1. Create an auth client at some OpenID site.
2. Set the redirect URI as `http://localhost:8080` 
3. Obtain the client ID and client secret.
```shell
$ export CLIENT_ID=xxx
$ export CLIENT_SECRET=yyy
```
4. Start the server:
```shell
$ node ./server.js
...
```

## Authorization Code Flow

```shell
$ ./clientsecret-auth.sh
(performs login)
(copy the code)
$ ./clientsecret-token.sh code
```

## Authorization Code Flow with PKCE

```shell
$ node ./pkce-generate-challenge.js
export CODE_CHALLENGE=h3Xmg...
export CODE_VERIFIER=75f71e039...
$ ./pkce-auth.sh
(performs login)
(copy the code)
$ ./pkce-token.sh code
```
