const express = require("express");
const router = express.Router();
const stuServ = require("../../services/studentService");

router.get("/", async (req, res) => {
  const page = req.query.page || 1;
  const limit = req.query.limit || 10;
  const sex = req.query.sex || -1;
  const name = req.query.name || "";
  // total   datas
  const result = await stuServ.getStudents(page, limit, sex, name);
  res.render("./students.ejs", {
    ...result,
    page,
    limit,
  });
});

module.exports = router;
