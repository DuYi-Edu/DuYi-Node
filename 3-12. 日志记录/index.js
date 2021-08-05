require("./init");

const stuServ = require("./services/studentService");
stuServ.getStudents().then((r) => {
  console.log(r);
});
