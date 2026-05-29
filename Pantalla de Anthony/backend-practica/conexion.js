const mysql = require("mysql2");

const conexion = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "14@nthoD0510",
  database: "floristeria_margarita",
  port: 3306
});

conexion.connect((error) => {
  if (error) {
    console.error("Error al conectar con MySQL:", error.message);
    return;
  }

  console.log("Conexion a MySQL realizada correctamente");
});

module.exports = conexion;
