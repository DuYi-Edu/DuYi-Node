const net = require("net");
const socket = net.createConnection(
  {
    host: "duyi.ke.qq.com",
    port: 80
  },
  () => {
    console.log("连接成功");
  }
);

var receive = null;
/**
 * 提炼出响应字符串的消息头和消息体
 * @param {*} response
 */
function parseResponse(response) {
  const index = response.indexOf("\r\n\r\n");
  const head = response.substring(0, index);
  const body = response.substring(index + 2);
  const headParts = head.split("\r\n");
  const headerArray = headParts.slice(1).map(str => {
    return str.split(":").map(s => s.trim());
  });
  const header = headerArray.reduce((a, b) => {
    a[b[0]] = b[1];
    return a;
  }, {});
  return {
    header,
    body: body.trimStart()
  };
}

function isOver() {
  //需要接收的消息体的总字节数
  const contentLength = +receive.header["Content-Length"];
  const curReceivedLength = Buffer.from(receive.body, "utf-8").byteLength;
  console.log(contentLength, curReceivedLength);
  return curReceivedLength > contentLength;
}

socket.on("data", chunk => {
  const response = chunk.toString("utf-8");
  if (!receive) {
    //第一次
    receive = parseResponse(response);
    if (isOver()) {
      socket.end();
    }
    return;
  }
  receive.body += response;
  if (isOver()) {
    socket.end();
    return;
  }
});

socket.write(`GET / HTTP/1.1
Host: duyi.ke.qq.com
Connection: keep-alive

`);

socket.on("close", () => {
  console.log(receive.body);
  console.log("结束了！");
});
