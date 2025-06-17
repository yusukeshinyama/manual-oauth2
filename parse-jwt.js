#!/usr/bin/env node
function parseJwt (token) {
    const [ header, payload, signature ] = token.split('.');
    return JSON.parse(Buffer.from(payload, 'base64').toString());
}
const token = process.argv[process.argv.length-1]
console.log(parseJwt(token))
