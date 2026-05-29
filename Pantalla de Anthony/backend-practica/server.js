const express = require("express");
const cors = require("cors");
const path = require("path");
const formularioProveedor = require("./routes/formularioProveedor");

const app = express();
const PUERTO = process.env.PORT || 3000;
const carpetaFrontend = path.join(__dirname, "../frontend-practica");

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(carpetaFrontend));

app.use("/api", formularioProveedor);

app.get("/", (req, res) => {
  res.sendFile(path.join(carpetaFrontend, "formularioProveedor.html"));
});

app.get("/formulario", (req, res) => {
  res.sendFile(path.join(carpetaFrontend, "formularioProveedor.html"));
});

const servidor = app.listen(PUERTO, () => {
  console.log(`Servidor ejecutandose en http://localhost:${PUERTO}`);
});

servidor.on("error", (error) => {
  if (error.code === "EADDRINUSE") {
    console.error(`El puerto ${PUERTO} ya esta en uso. Cierra el otro servidor o usa otro puerto.`);
    process.exit(1);
  }

  throw error;
});
