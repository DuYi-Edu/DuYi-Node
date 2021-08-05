const Book = require("../models/Book");
exports.addBook = async function (obj) {
  const ins = await Book.create(obj);
  return ins.toJSON();
};

exports.deleteBook = async function (id) {
  return await Book.destroy({
    where: {
      id,
    },
  });
};

exports.updateBook = async function (id, obj) {
  return await Book.update(obj, {
    where: {
      id,
    },
  });
};
