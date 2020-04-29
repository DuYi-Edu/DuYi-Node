const express = require("express");
const router = express.Router();
var svgCaptcha = require("svg-captcha");

router.get("/captcha", (req, res) => {
  var captcha = svgCaptcha.create({
    size: 6,
    ignoreChars: "iIl10oO",
    noise: 6,
    color: true,
  });
  req.session.captcha = captcha.text.toLowerCase(); //把验证码中的文本存放到session中

  res.type("svg");
  res.status(200).send(captcha.data);
});

function validateCaptcha(req, res, next) {
  const reqCaptcha = req.body.captcha ? req.body.captcha.toLowerCase() : ""; //用户传递的验证码
  if (reqCaptcha !== req.session.captcha) {
    //验证码有问题
    res.send({
      code: 401,
      msg: "验证码有问题",
    });
  } else {
    next();
  }

  req.session.captcha = "";
}

function captchaHandler(req, res, next) {
  if (!req.session.records) {
    // 如果session中没有访问记录
    req.session.records = [];
  }
  const now = new Date().getTime();
  req.session.records.push(now); // 把这一次请求的访问时间记录下来

  // 如果在一小段时间中请求达到了一定的数量，就可能是机器
  const duration = 10000;
  const repeat = 3;

  req.session.records = req.session.records.filter(
    (time) => now - time <= duration
  );

  if (req.session.records.length >= repeat || "captcha" in req.body) {
    // 验证验证码
    validateCaptcha(req, res, next);
  } else {
    next();
  }
}

router.post("*", captchaHandler);
router.put("*", captchaHandler);

module.exports = router;
