const start = Date.now();
setTimeout(function f1() {
  console.log("setTimeout", Date.now() - start);
}, 200);

const fs = require("fs");

fs.readFile("./index.js", "utf-8", function f2() {
  console.log("readFile");
  const start = Date.now();
  while (Date.now() - start < 300) {}
});
