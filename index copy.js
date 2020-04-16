require("./init");
const express = require("express");
const http = require("http");
const app = express(); //创建一个express应用
// app实际上是一个函数，用于处理请求的函数
const server = http.createServer(app);
const port = 5008;
server.listen(port, () => {
  console.log(`server listen on ${port}`);
});
