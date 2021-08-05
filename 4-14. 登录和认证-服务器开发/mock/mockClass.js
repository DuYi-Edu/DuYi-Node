const Mock = require("mockjs");
const result = Mock.mock({
  "datas|16": [
    {
      "id|+1": 1,
      name: "前端第 @id 期",
      openDate: "@date",
    },
  ],
}).datas;

const Class = require("../models/Class");
Class.bulkCreate(result);
