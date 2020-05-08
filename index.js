const express = require("express");
const http = require("http");
const path = require("path");
const xss = require("xss");
// express
const app = express();
const server = http.createServer(app);
app.use(express.static(path.resolve(__dirname, "public")));

app.use(express.json());
app.use(express.urlencoded());
const myxss = new xss.FilterXSS({
  onTagAttr(tag, name, value, isWhiteAttr) {
    if (name === "style") {
      return `style="${value}"`;
    }
  },
});
app.use((req, res, next) => {
  for (const key in req.body) {
    const value = req.body[key];
    req.body[key] = myxss.process(value);
  }
  next();
});

const articles = [];
app.post("/api/article/add", (req, res) => {
  articles.push(req.body.content);
  console.log(articles);
  res.send({
    code: 0,
    msg: "",
    data: "ok",
  });
});

app.get("/articles", (req, res) => {
  res.render("articles.ejs", {
    articles,
    redirect: req.query.redirect,
  });
});

// 监听端口
server.listen(5008, () => {
  console.log("server listening on 5008");
});
