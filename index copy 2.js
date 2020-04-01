let i = 0;
console.time();
function test() {
  i++;
  if (i < 1000) {
    setImmediate(test);
  } else {
    console.timeEnd();
  }
}

test();
