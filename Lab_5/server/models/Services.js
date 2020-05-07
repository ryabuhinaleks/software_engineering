const Sequelize = require("sequelize");
const db = require("../database/db.js");

module.exports = db.sequelize.define(
  "services",
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    date: {
      type: Sequelize.DATE
    }
	,
    id_client: {
      type: Sequelize.INTEGER
    }	
	,
    number: {
      type: Sequelize.STRING
    }
	,
    count: {
      type: Sequelize.INTEGER
    }
  },
  {
    timestamps: false
  }
);
