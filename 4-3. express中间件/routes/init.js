const express = require("express");
const app = express(); //创建一个express应用

app.use(require("./staticMiddleware"));

app.get("/news/abc", (req, res, next) => {
  console.log("handler1");
  // throw new Error("abc")
  // 相当于 next(new Error("abc"))
  next(new Error("abc"));
  //   next();
});

//能匹配  /news  /news/abc   /news/123   /news/ab/adfs
//不能匹配  /n   /a   /   /newsabc
app.use("/news", require("./errorMiddleware"));

const port = 5008;
app.listen(port, () => {
  console.log(`server listen on ${port}`);
});
