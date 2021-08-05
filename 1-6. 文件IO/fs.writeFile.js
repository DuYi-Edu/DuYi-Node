const fs = require("fs");
const path = require("path");

const filename = path.resolve(__dirname, "./myfiles/2.txt");

async function test() {
  // await fs.promises.writeFile(filename, "阿斯顿发发放到发", {
  //   flag: "a" //追加内容
  // });
  const buffer = Buffer.from("abcde", "utf-8");
  await fs.promises.writeFile(filename, buffer);
  console.log("写入成功");
}

test();
