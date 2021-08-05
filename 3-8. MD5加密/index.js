require("./models/relation");

const adminServ = require("./services/adminService");
// adminServ.updateAdmin(7, {
//   loginPwd: "123",
// });
adminServ.login("bcd", "123").then((r) => {
  console.log(r);
});
