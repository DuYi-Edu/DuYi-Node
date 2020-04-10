const adminServ = require("./services/adminService");
// adminServ.addAdmin({
//   loginId: "asdfasdfasdfssa",
//   loginPwd: "adsfasdfd",
// });

adminServ.deleteAdmin(4).then((r) => {
  console.log(r);
});

// adminServ
//   .updateAdmin(4, {
//     loginId: "aaaaaa",
//   })
//   .then((r) => {
//     console.log(r);
//   });
