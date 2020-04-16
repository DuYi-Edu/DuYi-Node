module.exports = (req, res, next) => {
  if (req.path.startsWith("/api")) {
    // 说明你请求的是 api 接口
    next();
  } else {
    // 说明你想要的是静态资源
    if (true) {
      res.send("静态资源");
    } else {
      next();
    }
  }
};
