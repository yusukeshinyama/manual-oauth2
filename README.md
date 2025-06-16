# manual-auth

OAuth2認証を手動でやるためのスクリプト集 (学習用)。

## 準備

1. あらかじめテスト用の OIDCクライアントを作成しておく。
2. Redirect URI は `http://localhost:8080` にする。 
3. Client ID および client secret を取得し、以下のように環境変数に設定しておく:
```shell
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
```

## Authorization Code Flow with PKCE

```shell
$ node ./pkce-generate-challenge.js
export CODE_CHALLENGE=h3Xmg...
export CODE_VERIFIER=75f71e039...
$ ./pkce-auth.sh
(ログイン実行)
(codeをコピーする)
$ ./pkce-token.sh code
```
