// require("./init");
const QRCode = require("qrcode");
QRCode.toDataURL("https://duyi.ke.qq.com/?tuin=a5d48d54", (err, url) => {
  if (err) {
    console.log(err);
  } else {
    console.log(url);
  }
});
