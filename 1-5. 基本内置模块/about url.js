const URL = require("url");

// const url = URL.parse("https://nodejs.org:80/a/b/c?t=3&u=5#abc");
// console.log(url);
// console.log(url.searchParams.has("a"));
// console.log(url.searchParams.has("t"));
// console.log(url.searchParams.get("t"));

const obj = {
  href: "https://nodejs.org:80/a/b/c?t=3&u=5#abc",
  origin: "https://nodejs.org:80",
  protocol: "https:",
  username: "",
  password: "",
  host: "nodejs.org:80",
  hostname: "nodejs.org",
  port: "80",
  pathname: "/a/b/c",
  search: "?t=3&u=5",
  hash: "#abc"
};

const url = URL.format(obj);
console.log(url);
