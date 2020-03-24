console.log("当前模块路径：", __dirname);
console.log("当前模块文件：", __filename);
exports.c = 3;
module.exports = {
  a: 1,
  b: 2
};
this.m = 5;

console.log(this === exports);
