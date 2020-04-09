const mysql = require("mysql2");

// 创建一个数据库连接
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "ybybdwyJ42.",
  database: "companydb",
});

// simple query
// connection.query("SELECT * FROM `company`;", function (err, results) {
//   //err错误
//   //result查询结果
//   console.log(results); // results contains rows returned by server
// });

// connection.query(
//   "insert into company(`name`,location,buildDate) values('abbc', '阿萨德', curdate());",
//   (err, result) => {
//     console.log(result);
//   }
// );

// connection.query(
//   "update company set `name`='bcd' where id=4",
//   (err, result) => {
//     console.log(result);
//   }
// );

connection.query(
    "delete from company where id=4",
    (err, result) => {
      console.log(result);
    }
  );