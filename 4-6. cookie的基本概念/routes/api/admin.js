const express = require("express");
const router = express.Router();
const adminServ = require("../../services/adminService");
const { asyncHandler } = require("../getSendResult");

router.post(
  "/login",
  asyncHandler(async (req, res) => {
    const result = await adminServ.login(req.body.loginId, req.body.loginPwd);
    if(result){
        //登录成功
        res.header("set-cookie", `token=${result.id}; path=/; domain=localhost; max-age=3600; httponly`);
    }
    return result;
  })
);

module.exports = router;
