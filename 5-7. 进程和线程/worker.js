const isPrime = require("./isPrime");
const {
  parentPort, // 用于与父线程通信的端口
  workerData, // 获取线程启动时传递的数据
  threadId, // 获取线程的唯一编号
} = require("worker_threads");

const name = `线程${threadId}`;

const newArr = [];
for (const n of workerData) {
  if (isPrime(n)) {
    newArr.push(n);
  }
}
console.log(`${name}处理完成，并把结果给予了主线程`);
parentPort.postMessage(newArr);
