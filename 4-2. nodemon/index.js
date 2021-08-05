require("./init");
const express = require("express");
const app = express(); //创建一个express应用
console.log(process.env.NODE_ENV);
app.get("*", (req, res) => {
  res.send("abc123");
});

const port = 5008;
app.listen(port, () => {
  console.log(`server listen on ${port}`);
});
