// nodejs 中开启子进程
const childProcess = require("child_process"); // 导入内置模块

childProcess.exec(`ls`, (err, out, stdErr) => {
  console.log(out);
  // 回调函数中可以获取子进程的标准输出，这种数据交互是通过IPC完成的，nodejs已经帮你完成了处理
  // err：开启进程过程中发生的错误
  // out: 子进程输出的正常内容
  // stdErr: 子进程输出的错误内容
  // 子进程发生任何的错误，绝不会影响到父进程，它们的内存空间是完全隔离的
});

// 过去，nodejs没有提供给用户创建线程的接口，只能使用进程的方式
// 过去，nodejs还提供了cluster模块，通过另一种模式来创建进程
// 现在，nodejs已经提供了线程模块，对进程的操作已经很少使用了
