const Class = require("../models/Class");
exports.addClass = async function (obj) {
  const ins = await Class.create(obj);
  return ins.toJSON();
};

exports.deleteClass = async function (id) {
  return await Class.destroy({
    where: {
      id,
    },
  });
};

exports.updateClass = async function (id, obj) {
  return await Class.update(obj, {
    where: {
      id,
    },
  });
};
