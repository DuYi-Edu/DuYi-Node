require("./init");

// const path = require("path");
// const jimp = require("jimp");

// // 给一张图片加水印
// async function mark(
//   waterFile,
//   originFile,
//   targetFile,
//   proportion = 5,
//   marginProportion = 0.01
// ) {
//   const [water, origin] = await Promise.all([
//     jimp.read(waterFile),
//     jimp.read(originFile),
//   ]);

//   // 对水印图片进行缩放
//   const curProportion = origin.bitmap.width / water.bitmap.width;
//   water.scale(curProportion / proportion);

//   // 计算位置
//   const right = origin.bitmap.width * marginProportion;
//   const bottom = origin.bitmap.height * marginProportion;
//   const x = origin.bitmap.width - right - water.bitmap.width;
//   const y = origin.bitmap.height - bottom - water.bitmap.height;

//   // 写入水印
//   origin.composite(water, x, y, {
//     mode: jimp.BLEND_SOURCE_OVER,
//     opacitySource: 0.3,
//   });

//   await origin.write(targetFile);
// }

// async function test() {
//   const waterPath = path.resolve(__dirname, "./water.jpg");
//   const originPath = path.resolve(__dirname, "./origin.jpg");
//   const targetPath = path.resolve(__dirname, "./new.jpg");
//   mark(waterPath, originPath, targetPath);
// }

// test();
