const Mock = require("mockjs");
const result = Mock.mock({
  "datas|500-700": [
    {
      name: "@cname",
      birthdady: "@date",
      "sex|1-2": true,
      mobile: /1\d{10}/,
      //   location: "@city(true)",
      "ClassId|1-16": 0,
    },
  ],
}).datas;
console.log(result);
const Student = require("../models/Student");
Student.bulkCreate(result);
