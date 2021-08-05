const mysql = require("mysql2/promise");

async function test() {
  // 创建一个数据库连接
  const connection = await mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "ybybdwyJ42.",
    database: "companydb",
  });
//   console.log(connection);
  const [results] = await connection.query("SELECT * FROM `company`;");
  console.log(results);
  connection.end();
}
test();
