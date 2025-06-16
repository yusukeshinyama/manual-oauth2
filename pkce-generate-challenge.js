#!/usr/bin/env node
const crypto = require("node:crypto");

const generateVerifier = () => {
    return crypto.randomBytes(64).toString('hex');
}

const getChallenge = verifier => {
    return crypto.createHash('sha256')
        .update(verifier)
        .digest('base64')
        .replace(/\+/g, '-')
        .replace(/\//g, '_')
        .replace(/=/g, '')
}

const verifier = generateVerifier()
const challenge = getChallenge(verifier)
console.log(`export CODE_CHALLENGE=${challenge}`)
console.log(`export CODE_VERIFIER=${verifier}`)
