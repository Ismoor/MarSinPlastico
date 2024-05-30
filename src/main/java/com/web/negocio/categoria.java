package com.web.negocio;

import com.web.datos.conexion;
import java.sql.*;

public class categoria {
	private int id;
	private String nombre;

	public categoria(int id, String nombre) {
		this.id = id;
		this.nombre = nombre;
	}

	public categoria() {
		// Constructor sin argumentos
		// Puedes dejar este constructor vacío o inicializar valores predeterminados si es necesario
	}

	public String obtenerNombreCategoria(int idCategoria) {
		String nombreCategoria = "";
		String sql = "SELECT descripcion_cat FROM tb_categoria WHERE id_cat=" + idCategoria;
		ResultSet rs = null;
		conexion con = new conexion();

		try {
			rs = con.Consulta(sql);
			if (rs.next()) {
				nombreCategoria = rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}

		return nombreCategoria;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	

	
	// Puedes agregar otros métodos relacionados con la lógica de negocio de la categoría
}