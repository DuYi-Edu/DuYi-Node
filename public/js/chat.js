const socket = io.connect();

// 客户端发送消息给服务器
page.onLogin = function (username) {
  socket.emit("login", username);
};

page.onSendMsg = function (me, msg, to) {
  socket.emit("msg", {
    to,
    content: msg,
  });
  page.addMsg(me, msg, to);
  page.clearInput();
};

// 客户端监听服务器消息
socket.on("login", (result) => {
  if (result) {
    page.intoChatRoom();
    socket.emit("users", "");
  } else {
    alert("昵称不可用，请更换昵称");
  }
});

socket.on("users", (users) => {
  page.initChatRoom();
  for (const u of users) {
    page.addUser(u);
  }
});

socket.on("userin", (username) => {
  page.addUser(username);
});

socket.on("userout", (username) => {
  page.removeUser(username);
});

socket.on("new msg", (result) => {
  page.addMsg(result.from, result.content, result.to);
});
