const mysql = require("mysql2");

// 创建一个数据库连接
const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "1moxiaosuda",
    database: "test",
});

connection.query(
    "insert into student(name,sex) values('雪含',0)",
    (err, result) => {
        console.log(result);
    }
);