// require("./models/sync");

// 增加
const Admin = require("./models/Admin");
// const ins = Admin.build({
//   loginId: "abc",
//   loginPwd: "123",
// }); //同步方法，构建一个模型实例
// ins.loginId = "bcd";
// ins.save().then(() => {
//   console.log("新建管理员成功");
// });

Admin.create({
  loginId: "admin",
  loginPwd: "123456",
}).then((ins) => {
  console.log(ins.id, ins.loginId, ins.loginPwd);
});
