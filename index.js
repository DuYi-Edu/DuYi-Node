//静态资源服务器
// http://localhost:9527/index.html  -> public/index.html 文件内容
// http://localhost:9527/css/index.css  -> public/css/index.css 文件内容

const http = require("http");
const URL = require("url");
const path = require("path");
const fs = require("fs");

async function getStat(filename) {
  try {
    return await fs.promises.stat(filename);
  } catch {
    return null;
  }
}

/**
 * 得到要处理的文件内容
 */
async function getFileContent(url) {
  const urlObj = URL.parse(url);
  let filename; //要处理的文件路径
  filename = path.resolve(__dirname, "public", urlObj.pathname.substr(1));
  let stat = await getStat(filename);
  if (!stat) {
    //文件不存在
    return null;
  } else if (stat.isDirectory()) {
    //文件是一个目录
    filename = path.resolve(
      __dirname,
      "public",
      urlObj.pathname.substr(1),
      "index.html"
    );
    stat = await getStat(filename);
    if (!stat) {
      return null;
    } else {
      return await fs.promises.readFile(filename);
    }
  } else {
    return await fs.promises.readFile(filename);
  }
}

async function handler(req, res) {
  const info = await getFileContent(req.url);
  if (info) {
    res.write(info);
  } else {
    res.statusCode = 404;
    res.write("Resource is not exist");
  }
  res.end();
}

const server = http.createServer(handler);
server.on("listening", () => {
  console.log("server listen 6000");
});
server.listen(6100);
