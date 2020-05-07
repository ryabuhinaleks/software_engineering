const Sequelize = require("sequelize");
const db = require("../database/db.js");

module.exports = db.sequelize.define(
  "applications",
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
	model: {
      type: Sequelize.STRING
    }
	,
    description: {
      type: Sequelize.STRING
    }
	,
    year: {
      type: Sequelize.INTEGER
    }
	,
    sum: {
      type: Sequelize.INTEGER
    }
  },
  {
    timestamps: false
  }
);
