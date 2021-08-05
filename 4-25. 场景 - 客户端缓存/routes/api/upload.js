const express = require("express");
const router = express.Router();
const multer = require("multer");
const path = require("path");
const jimp = require("jimp");

// 给一张图片加水印
async function mark(
  waterFile,
  originFile,
  targetFile,
  proportion = 5,
  marginProportion = 0.01
) {
  const [water, origin] = await Promise.all([
    jimp.read(waterFile),
    jimp.read(originFile),
  ]);

  // 对水印图片进行缩放
  const curProportion = origin.bitmap.width / water.bitmap.width;
  water.scale(curProportion / proportion);

  // 计算位置
  const right = origin.bitmap.width * marginProportion;
  const bottom = origin.bitmap.height * marginProportion;
  const x = origin.bitmap.width - right - water.bitmap.width;
  const y = origin.bitmap.height - bottom - water.bitmap.height;

  // 写入水印
  origin.composite(water, x, y, {
    mode: jimp.BLEND_SOURCE_OVER,
    opacitySource: 0.3,
  });

  await origin.write(targetFile);
}
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.resolve(__dirname, "../../public/origin"));
  },
  filename: function (req, file, cb) {
    // 时间戳-6位随机字符.文件后缀
    const timeStamp = Date.now();
    const ramdomStr = Math.random().toString(36).slice(-6);
    const ext = path.extname(file.originalname);
    const filename = `${timeStamp}-${ramdomStr}${ext}`;
    cb(null, filename);
  },
});

const upload = multer({
  storage,
  limits: {
    // fileSize: 150 * 1024,
  },
  fileFilter(req, file, cb) {
    //验证文件后缀名
    const extname = path.extname(file.originalname);
    const whitelist = [".jpg", ".gif", "png"];
    if (whitelist.includes(extname)) {
      cb(null, true);
    } else {
      cb(new Error(`your ext name of ${extname} is not support`));
    }
  },
});
const waterPath = path.resolve(__dirname, "../../public/img/water.jpg");
router.post("/", upload.single("img"), async (req, res) => {
  const url = `/upload/${req.file.filename}`;
  const newPath = path.resolve(
    __dirname,
    "../../public/upload",
    req.file.filename
  );
  // 加水印
  await mark(waterPath, req.file.path, newPath);
  res.send({
    code: 0,
    msg: "",
    data: url,
  });
});

module.exports = router;
