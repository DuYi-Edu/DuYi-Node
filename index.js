const moment = require("moment");
moment.locale("zh-cn");
//得到当前时间，moment对象
// console.log(moment().toString());
// console.log(moment.utc().toString());

//得到当前时间戳
// console.log(moment().valueOf(), +moment());
// console.log(moment.utc().valueOf(), +moment.utc());

//根据指定的时间格式得到时间，时间格式：xxxx-xx-xx xxxx/xx/xx  时间戳
// console.log(moment(0).toString(), +moment(0));
// console.log(moment.utc(0).toString(), +moment.utc(0));
// const value = "1970-01-01 00:00:00";
// console.log(moment(value).toString(), +moment(value));
// console.log(moment.utc(value).toString(), +moment.utc(value));

//使用日期令牌转换
//令牌是一个格式化的字符串，例如： "YYYY-MM-DD HH:mm:ss"
const formats = ["YYYY-MM-DD HH:mm:ss", "YYYY-M-D H:m:s", "x"];
// console.log(moment.utc("1970-01-01 00:00:00", formats, true).toString());
// console.log(moment.utc("1970-1-1 0:0:0", formats, true).toString());
// console.log(moment.utc(0, formats, true).toString());
// const invalidMoment = moment.utc(
//   "Thu Jan 01 1970 00:00:00 GMT+0000",
//   formats,
//   true
// );
// console.log(invalidMoment.isValid()); // false
// console.log(invalidMoment.toString());
// console.log(+invalidMoment);

// 显示（发生在客户端）
// const m = moment.utc("2015-1-5 23:00:01", formats, true);
// console.log(m.local().format("YYYY年MM月DD日 HH点mm分ss秒"));

// const m = moment("2015-1-5 23:00:01", formats, true);
// const toServer = m.utc().format("YYYY-MM-DD HH:mm:ss");
// console.log(toServer);

const m = moment.utc("2020-4-14 9:00:01", formats, true);
console.log(m.local().fromNow());
