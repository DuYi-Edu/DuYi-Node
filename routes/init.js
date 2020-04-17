const express = require("express");
const app = express(); //创建一个express应用
const path = require("path");
const staticRoot = path.resolve(__dirname, "../public");

/**
 * 下面这段代码的作用：
 * 当请求时，会根据请求路径(req.path)，从指定的目录中寻找是否存在该文件，如果存在，直接响应文件内容，而不再移交给后续的中间件
 * 如果不存在文件，则直接移交给后续的中间件处理
 * 默认情况下，如果映射的结果是一个目录，则会自动使用index.html文件
 */
app.use(express.static(staticRoot));
// app.use("/static", (req, res) => {
//   console.log(req.baseUrl, req.path);
// });

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
// app.use(require("./myUrlEncoded"));

app.post("/api/student", (req, res) => {
  console.log(req.body);
});

app.use(require("./errorMiddleware"));

const port = 5008;
app.listen(port, () => {
  console.log(`server listen on ${port}`);
});
