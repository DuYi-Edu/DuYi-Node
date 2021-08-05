// 设置模型关系
const Class = require("./Class");
const Student = require("./Student");
Class.hasMany(Student);
Student.belongsTo(Class);
