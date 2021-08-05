const url = require("url");
const path = require("path");
module.exports = (req, res, next) => {
  const host = req.headers.host; //获取本网站的主机名（包括端口号）
  let referer = req.headers.referer;

  // 只处理图片
  const extname = path.extname(req.path);
  if (![".jpg", ".jpeg", ".png", ".gif"].includes(extname)) {
    next();
    return;
  }
  if (referer) {
    referer = url.parse(referer).host;
  }
  if (referer && host !== referer) {
    req.url = "/img/logo.jpg"; // url rewrite
  }
  next();
};
