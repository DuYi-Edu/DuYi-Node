const path = require("path");

// const basename = path.basename("fdg/dfgdfg/adfaf/fdgdfgd/a.asf", ".html");
// console.log(basename);

// console.log(path.sep);

// console.log(process.env.PATH.split(path.delimiter));

// const dir = path.dirname("a/b/c/d");
// console.log(dir);

// const ext = path.extname("a/b/c/a.js");
// console.log(ext);
// const basePath = "a/b";
// const fullpath = path.join(basePath, "../", "d.js");
// console.log(fullpath);

// const rel = path.relative('/data/orandea/test/aaa', '/data/orandea/impl/bbb');
// console.log(rel)

const absPath = path.resolve(__dirname, "./a.js");
console.log(absPath);
