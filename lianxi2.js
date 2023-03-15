const mysql = require("mysql2/promise");

async function test() {
    const connection = await mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "1moxiaosuda",
        database: "test",
    });
    let [results] = await connection.query("insert into student(name,sex) values('凯琴',0)");
    console.log(results)
}
test()