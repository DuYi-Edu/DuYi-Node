const { EventEmitter } = require("events");
// 创建一个事件处理对象
// 可以注册事件，可以触发事件
const ee = new EventEmitter();

ee.on("abc", () => {
  console.log("abc事件触发了1");
});
const fn2 = () => {
  console.log("abc事件触发了2");
}
ee.on("abc", fn2);

ee.once("abc", () => {
  console.log("abc事件触发了3", "该事件只触发一次");
});

ee.on("bcd", () => {
  console.log("bcd事件触发了3");
});

ee.emit("abc"); //触发名为abc的事件，会依次运行注册的事件函数
ee.off("abc", fn2)
ee.emit("abc"); //触发名为abc的事件，会依次运行注册的事件函数
ee.emit("abc"); //触发名为abc的事件，会依次运行注册的事件函数
ee.emit("bcd"); //触发名为bcd的事件，会依次运行注册的事件函数

console.log("script end")