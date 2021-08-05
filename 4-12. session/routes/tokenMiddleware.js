const { getErr } = require("./getSendResult");
const { pathToRegexp } = require("path-to-regexp");
const cryptor = require("../util/crypt");
const needTokenApi = [
  { method: "POST", path: "/api/student" },
  { method: "PUT", path: "/api/student/:id" },
];

// 用于解析token
module.exports = (req, res, next) => {
  // /api/student/:id 和  /api/student/1771
  const apis = needTokenApi.filter((api) => {
    const reg = pathToRegexp(api.path);
    return api.method === req.method && reg.test(req.path);
  });
  if (apis.length === 0) {
    next();
    return;
  }
  if (req.session.loginUser) {
    //说明已经登录过了
    next();
  } else {
    handleNonToken(req, res, next);
  }
};

//处理没有认证的情况
function handleNonToken(req, res, next) {
  res
    .status(403)
    .send(getErr("you dont have any token to access the api", 403));
}
