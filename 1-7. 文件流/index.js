const fs = require("fs");
const path = require("path");

//方式2
async function method2() {
  const from = path.resolve(__dirname, "./temp/abc.txt");
  const to = path.resolve(__dirname, "./temp/abc2.txt");
  console.time("方式2");

  const rs = fs.createReadStream(from);
  const ws = fs.createWriteStream(to);

  rs.pipe(ws);

  rs.on("close", () => {
    console.timeEnd("方式2");
  });
}

method2();
