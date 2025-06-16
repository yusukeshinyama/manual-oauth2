#!/usr/bin/env node
const http = require('http');
const port = parseInt(process.env.PORT || '8080');
const contentType = process.env.CONTENT_TYPE || 'text/html';
const body = process.env.BODY ?? '<h1>Hello world!</h1>';
const server = http.createServer((request, response) => {
  console.info(request.socket?.remoteAddress, request.method, request.url, request.httpVersion);
  console.info(request.headers);
  const i = request.url.indexOf("?");
  const r = []
  if (0 <= i) { 
    const query = request.url.substring(i);
    const params = new URLSearchParams(query);
    for (const [key,value] of params.entries()) {
      r.push(`<li> ${key}: ${value}`)
    }
  }
  request.on('data', (data) => { console.info('data', data) });
  response.writeHead(200, {'Content-Type': contentType, 'Access-Control-Allow-Origin': '*'});
  response.end(body+"<ul>"+r.join("")+"</ul>");
});
console.info(`listening on :${port}...`);
server.listen(port);
