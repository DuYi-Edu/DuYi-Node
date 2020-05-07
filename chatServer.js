const socketIO = require("socket.io");

let users = [];

module.exports = function (server) {
  const io = socketIO(server);
  io.on("connection", (socket) => {
    let curUser = ""; //当前用户名
    // 监听客户端消息
    socket.on("login", (data) => {
      if (
        data === "所有人" ||
        users.filter((u) => u.username === data).length > 0
      ) {
        //昵称不可用
        socket.emit("login", false);
      } else {
        // 昵称可用
        users.push({
          username: data,
          socket,
        });
        curUser = data;
        socket.emit("login", true);
        // 新用户进入了
        socket.broadcast.emit("userin", data);
      }
    });

    socket.on("users", () => {
      const arr = users.map((u) => u.username);
      socket.emit("users", arr);
    });

    socket.on("msg", (data) => {
      if (data.to) {
        // 发送给指定的用户
        const us = users.filter((u) => u.username === data.to);
        const u = us[0];
        u.socket.emit("new msg", {
          from: curUser,
          content: data.content,
          to: data.to,
        });
      } else {
        // 发送给所有人
        socket.broadcast.emit("new msg", {
          from: curUser,
          content: data.content,
          to: data.to,
        });
      }
    });

    socket.on("disconnect", () => {
      socket.broadcast.emit("userout", curUser);
      users = users.filter((u) => u.username !== curUser);
    });
  });
};
