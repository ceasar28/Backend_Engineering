const http = require("http");

const server = http.createServer((req, res) => {
  const url = req.url;
  if (url === "/") {
    res.write(`<html><body>
        <form action="/message" method="POST"><input type="text" name="message"><button type="submit">Send</button></form></body>
        </html>`);
    return res.end();
  }
  res.setHeader("Content-Type", "text/html");
  res.write(`<html><body>
        <h1>Hello !!!</h1></body>
        </html>`);
  res.end();
});

server.listen(3000);
