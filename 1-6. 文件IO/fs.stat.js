const fs = require("fs");
const path = require("path");
const filename = path.resolve(__dirname, "./myfiles/");
async function test() {
  const stat = await fs.promises.stat(filename);
  console.log(stat);
  console.log("是否是目录", stat.isDirectory());
  console.log("是否是文件", stat.isFile());
}

test();
