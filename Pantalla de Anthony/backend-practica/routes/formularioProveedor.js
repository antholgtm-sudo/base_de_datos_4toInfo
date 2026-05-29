const express = require("express");
const conexion = require("../conexion");

const router = express.Router();

router.get("/ciudades", (req, res) => {
  const sql = "SELECT id_ciudad, nombre FROM ciudad ORDER BY nombre";

  conexion.query(sql, (error, resultados) => {
    if (error) {
      return res.status(500).json({ mensaje: "Error al obtener las ciudades" });
    }

    res.json(resultados);
  });
});

router.get("/sectores", (req, res) => {
  const sql = "SELECT id_sector, nombre, tipo_sector FROM sector ORDER BY nombre";

  conexion.query(sql, (error, resultados) => {
    if (error) {
      return res.status(500).json({ mensaje: "Error al obtener los sectores" });
    }

    res.json(resultados);
  });
});

router.post("/proveedores", (req, res) => {
  const nombre = req.body.nombre;
  const apellido_paterno = req.body.apellido_paterno;
  const apellido_materno = req.body.apellido_materno || null;
  const sexo = req.body.sexo;
  const telefono = req.body.telefono;
  const nombre_proveedor = req.body.nombre_proveedor || req.body.proveedor;
  const tipo_proveedor = req.body.tipo_proveedor || req.body.tipo;
  const id_ciudad = Number(req.body.id_ciudad);
  const id_sector = Number(req.body.id_sector);
  const calle_proveedor = req.body.calle_proveedor || req.body.calle;
  const num_departamento = req.body.num_departamento;
  const correo_proveedor = req.body.correo_proveedor || req.body.correo;

  if (
    !nombre ||
    !apellido_paterno ||
    !sexo ||
    !telefono ||
    !nombre_proveedor ||
    !tipo_proveedor ||
    Number.isNaN(id_ciudad) ||
    Number.isNaN(id_sector) ||
    !calle_proveedor ||
    !num_departamento ||
    !correo_proveedor
  ) {
    return res.status(400).json({ mensaje: "Complete todos los campos obligatorios" });
  }

  conexion.beginTransaction((error) => {
    if (error) {
      return res.status(500).json({ mensaje: "Error al iniciar el registro" });
    }

    const buscarTipoSql = "SELECT id_tipo FROM tipo_tercero WHERE nombre = 'Proveedor' LIMIT 1";

    conexion.query(buscarTipoSql, (tipoError, tipos) => {
      if (tipoError) {
        return conexion.rollback(() => {
          res.status(500).json({ mensaje: "Error al buscar el tipo de tercero" });
        });
      }

      const registrarProveedor = (idTipoProveedor) => {
        const terceroSql = `
          INSERT INTO tercero
          (nombre, apellido_paterno, apellido_materno, sexo, id_tipo, telefono)
          VALUES (?, ?, ?, ?, ?, ?)
        `;

        const terceroValores = [
          nombre,
          apellido_paterno,
          apellido_materno,
          sexo,
          idTipoProveedor,
          telefono
        ];

        conexion.query(terceroSql, terceroValores, (terceroError, terceroResultado) => {
          if (terceroError) {
            return conexion.rollback(() => {
              res.status(500).json({ mensaje: "Error al registrar el representante" });
            });
          }

          const proveedorSql = `
            INSERT INTO proveedor
            (id_tercero, nombre, tipo, id_ciudad, id_sector, calle_proveedor, num_departamento, correo_proveedor, estado)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'activo')
          `;

          const proveedorValores = [
            terceroResultado.insertId,
            nombre_proveedor,
            tipo_proveedor,
            id_ciudad,
            id_sector,
            calle_proveedor,
            num_departamento,
            correo_proveedor
          ];

          conexion.query(proveedorSql, proveedorValores, (proveedorError, proveedorResultado) => {
            if (proveedorError) {
              return conexion.rollback(() => {
                res.status(500).json({ mensaje: "Error al registrar el proveedor" });
              });
            }

            conexion.commit((commitError) => {
              if (commitError) {
                return conexion.rollback(() => {
                  res.status(500).json({ mensaje: "Error al guardar los datos" });
                });
              }

              res.status(201).json({
                mensaje: "Proveedor registrado correctamente",
                id_proveedor: proveedorResultado.insertId
              });
            });
          });
        });
      };

      if (tipos.length > 0) {
        registrarProveedor(tipos[0].id_tipo);
        return;
      }

      const crearTipoSql = `
        INSERT INTO tipo_tercero (nombre, descripcion)
        VALUES ('Proveedor', 'Persona que suministra productos a la floristeria')
      `;

      conexion.query(crearTipoSql, (crearTipoError, crearTipoResultado) => {
        if (crearTipoError) {
          return conexion.rollback(() => {
            res.status(500).json({ mensaje: "Error al crear el tipo de proveedor" });
          });
        }

        registrarProveedor(crearTipoResultado.insertId);
      });
    });
  });
});

module.exports = router;
