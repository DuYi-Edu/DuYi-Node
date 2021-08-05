const express = require("express");
const path = require("path");
const router = express.Router();

router.get("/:filename", (req, res) => {
  const absPath = path.resolve(
    __dirname,
    "../../resources",
    req.params.filename
  );
  res.download(absPath, req.params.filename);
});

module.exports = router;
