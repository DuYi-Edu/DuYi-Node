// 处理错误的中间件

module.exports = (err, req, res, next) => {
  if (err) {
    const errObj = {
      code: 500,
      msg: err instanceof Error ? err.message : err,
    };
    //发生了错误
    res.status(500).send(errObj);
  } else {
    next();
  }
};
