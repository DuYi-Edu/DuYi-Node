const express = require("express");
const app = express();
const cors = require("cors");

// const history = require("connect-history-api-fallback");
// app.use(history());

app.use(require("./imgProtectMid"));
app.use(
  require("express-session")({
    secret: "duyiedu",
  })
);

// 映射public目录中的静态资源
const path = require("path");
const staticRoot = path.resolve(__dirname, "../public");
app.use(
  express.static(staticRoot, {
    setHeaders(res, path) {
      if (!path.endsWith(".html")) {
        res.header("Cache-Control", `max-age=${3600*24*365*100}`);
      }
    },
  })
);

app.use(
  cors({
    origin(origin, callback) {
      if (!origin) {
        callback(null, "*");
        return;
      }
      callback(null, origin);
    },
    credentials: true,
  })
);

// 加入cookie-parser 中间件
// 加入之后，会在req对象中注入cookies属性，用于获取所有请求传递过来的cookie
// 加入之后，会在res对象中注入cookie方法，用于设置cookie
const cookieParser = require("cookie-parser");
app.use(cookieParser());

// 应用token中间件
app.use(require("./tokenMiddleware"));

// 解析 application/x-www-form-urlencoded 格式的请求体
app.use(express.urlencoded({ extended: true }));

// 解析 application/json 格式的请求体
app.use(express.json());

// 使用代理
app.use(require("./proxyMid"));

app.use(require("./apiLoggerMid"));

app.use(require("./captchaMid"));

// 模板引擎
app.set("views", path.resolve(__dirname, "./views"));
app.use("/student", require("./controller/student"));

// 处理 api 的请求
app.use("/api/student", require("./api/student"));
app.use("/api/book", require("./api/book"));
// app.use("/api/class", require("./api/class"));
app.use("/api/admin", require("./api/admin"));
app.use("/api/upload", require("./api/upload"));

// 处理对下载资源的请求
app.use("/res", require("./api/download"));

// 处理错误的中间件
app.use(require("./errorMiddleware"));

const port = 5008;
app.listen(port, () => {
  console.log(`server listen on ${port}`);
});
