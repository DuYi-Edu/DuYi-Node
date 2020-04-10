const { Sequelize } = require("sequelize");

const sequelize = new Sequelize("myschooldb", "root", "ybybdwyJ42.", {
  host: "localhost",
  dialect: "mysql",
  // logging: null
});

module.exports = sequelize;
