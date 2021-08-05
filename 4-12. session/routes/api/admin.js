const express = require("express");
const router = express.Router();
const adminServ = require("../../services/adminService");
const { asyncHandler } = require("../getSendResult");
const cryptor = require("../../util/crypt");

router.post(
  "/login",
  asyncHandler(async (req, res) => {
    const result = await adminServ.login(req.body.loginId, req.body.loginPwd);
    if (result) {
      let value = result.id;
      value = cryptor.encrypt(value.toString());
      //登录成功
      req.session.loginUser = result;
    }
    return result;
  })
);

module.exports = router;
