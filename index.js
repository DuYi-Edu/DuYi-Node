const MyRequest = require("./MyRequest");

const request = new MyRequest("http://duyi.ke.qq.com");

request.send();

request.on("res", (headers, body) => {
  console.log(headers);
  console.log(body);
});
