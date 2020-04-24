const path = require("path");

module.exports = {
  devServer: {
    proxy: {
      "/api": {
        target: "http://localhost:5008",
      },
    },
  },
  outputDir: path.resolve(__dirname, "../public"),
};
