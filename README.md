# manual-auth

OAuth2認証を手動でやるためのスクリプト集 (学習用)。

## 準備

1. あらかじめテスト用の OIDCクライアントを作成しておく。
2. Redirect URI は `http://localhost:8080` にする。 
3. 各エンドポイント、Client ID および client secret を取得し、以下のように環境変数に設定しておく:
```shell
$ export ENDPOINT_AUTH=https://accounts.google.com/o/oauth2/v2/auth
$ export ENDPOINT_TOKEN=https://oauth2.googleapis.com/token
$ export CLIENT_ID=xxx
$ export CLIENT_SECRET=yyy
```
4. コード受け取り用のサーバを起動しておく:
```shell
$ node ./server.js
...
```

## Authorization Code Flow

```shell
$ ./clientsecret-auth.sh
(ログイン実行)
(codeをコピーする)
$ ./clientsecret-token.sh code
{
  "access_token": "ya29...",
  "expires_in": 3591,
  "scope": "openid https://www.googleapis.com/auth/userinfo.email",
  "token_type": "Bearer",
  "id_token": "eyJhbGciOiJSUzI1NiIsImtpZCI6IjFiY..."
}
$ node ./parse-jwt.js eyJhbGciOiJSUzI1NiIsImtpZCI6IjFiY...
(取得したJWTの中身を確認)
{
  iss: 'https://accounts.google.com',
  azp: '72469...',
  aud: '72469...',
  sub: '10483...',
  email: 'yusuke@bekindlabs',
  email_verified: true,
  at_hash: 'DAf6z...',
  iat: 1750122255,
  exp: 1750125855
}
```

## Authorization Code Flow with PKCE

```shell
$ node ./pkce-generate-challenge.js
export CODE_CHALLENGE=h3Xmg...
export CODE_VERIFIER=75f71e039...
(challenge, verifierを環境変数に入れておく)
$ ./pkce-auth.sh
(ログイン実行)
(codeをコピーする)
$ ./pkce-token.sh code
```
