const express = require("express");
const socketIO = require("socket.io");
const http = require("http");
const path = require("path");

// express
const app = express();
const server = http.createServer(app);
app.use(express.static(path.resolve(__dirname, "public")));

// websocket
const io = socketIO(server);

io.on("connection", (socket) => {
  // 当有一个新的客户端连接到服务器成功之后，触发的事件
  console.log("新的客户端连接进来了");
  socket.on("msg", (chunk) => {
    // 监听客户端的msg消息
    console.log(chunk.toString("utf-8"));
  });
  const timer = setInterval(function () {
    //每隔两秒钟，发送一个消息给客户端，消息为test
    socket.emit("test", "test message from server");
  }, 2000);

  socket.on("disconnect", () => {
    clearInterval(timer);
    console.log("closed");
  });
});

// 监听端口
server.listen(5008, () => {
  console.log("server listening on 5008");
});
