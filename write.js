const fs = require("fs");
const path = require("path");

const filename = path.resolve(__dirname, "./temp/abc.txt");

const ws = fs.createWriteStream(filename, {
  encoding: "utf-8",
  highWaterMark: 16 * 1024
});

let i = 0;
//一直写，直到到达上限，或无法再直接写入
function write() {
  let flag = true;
  while (i < 1024 * 1024 * 10 && flag) {
    flag = ws.write("a"); //写入a，得到下一次还能不能直接写
    i++;
  }
}

write();

ws.on("drain", () => {
  write();
});
