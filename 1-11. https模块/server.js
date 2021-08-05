const http = require("http");
const url = require("url");

function handleReq(req) {
  console.log("有请求来了！");
  const urlobj = url.parse(req.url);
  console.log("请求路径", urlobj);
  console.log("请求方法", req.method);
  console.log("请求头", req.headers);

  let body = "";
  req.on("data", chunk => {
    body += chunk.toString("utf-8");
  });

  req.on("end", () => {
    console.log("请求体", body);
  });
}

const server = http.createServer((req, res) => {
  handleReq(req);
  res.setHeader("a", "1");
  res.setHeader("b", "2");
  res.statusCode = 404;
  res.write("你好！");
  res.end();
});

server.listen(9527);

server.on("listening", () => {
  console.log("server listen 9527");
});
