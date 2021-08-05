const isPrime = require("./isPrime");
const arr = require("./numbers.json")
console.time();
const newArr = [];
for (const n of arr) {
  if (isPrime(n)) {
    newArr.push(n);
  }
}
console.timeEnd();
console.log(newArr);
