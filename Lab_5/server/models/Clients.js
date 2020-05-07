const Sequelize = require("sequelize");
const db = require("../database/db.js");

module.exports = db.sequelize.define(
  "clients",
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: Sequelize.STRING
    }
	,
    score: {
      type: Sequelize.STRING
    }
	,
    city: {
      type: Sequelize.STRING
    }
	,
    telephone: {
      type: Sequelize.STRING
    }
  },
  {
    timestamps: false
  }
);
