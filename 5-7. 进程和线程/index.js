const { Worker } = require("worker_threads");
const os = require("os");
const arr = require("./numbers.json");
const cpuNumber = os.cpus().length;
const len = Math.ceil(arr.length / cpuNumber); //得到每个线程需要处理的数字数量

console.time();
let numbers = cpuNumber; //目前的线程数量
const newArr = []; //保存最终结果
for (let i = 0; i < cpuNumber; i++) {
  const data = arr.slice(i * len, (i + 1) * len);
  const worker = new Worker("./worker.js", {
    workerData: data,
  }); // worker是子线程实例
  worker.on("message", (result) => {
    newArr.push(...result);
    numbers--;
    if (numbers === 0) {
      console.timeEnd();
      // 所有线程都处理结束
      console.log(newArr); //输出最终结果
    }
    worker.terminate();
  });
}

// // 通过EventEmitter监听子线程的事件
// worker.on("exit", () => {
//   // 当子线程退出时运行的事件
// });
// worker.on("message", (msg) => {
//   // 收到子线程发送的消息时运行的事件
// });
// worker.postMessage(任意消息); // 父线程向子线程发送任意消息
// worker.terminate(); // 退出子线程
