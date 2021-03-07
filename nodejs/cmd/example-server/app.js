const http = require('http');


const addr = '0.0.0.0';
const port = 8080;

const server = http.createServer((req, res) => {
  console.log("server hit");
  res.end("hello");
});

server.listen(port, addr, () => {
  console.log(`Serving http://${addr}:${port}/`);
});
