package com.web.negocio;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.web.datos.conexion;

public class post {
	private int id_post;
	private int id_cat;
	private String descripcion_post;

	public post(int id_post, int id_cat, String descripcion_post) {
		super();
		this.id_post = id_post;
		this.id_cat = id_cat;
		this.descripcion_post = descripcion_post;
	}

	public post(int id_cat, String descripcion_post) {
		this.id_cat = id_cat;
		this.descripcion_post = descripcion_post;
	}

	public post() {

	}


	public String ingresarArticulo(int cat,String desc)
	{
		String result="";
		conexion con=new conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_post (id_cat,"
				+ "descripcion_post)"
				+ "VALUES(?,?)";
		try{
			pr=con.getCon().prepareStatement(sql);
			pr.setInt(1,cat);
			pr.setString(2,desc);
			if(pr.executeUpdate()==1)
			{
				result="Se ingreso correctamente.";
			}
			else
			{
				result="No se ingreso a la base de datos.";
			}
		}
		catch(Exception ex)
		{
			result=ex.getMessage();
		}
		finally
		{
			try
			{
				pr.close();
				con.getCon().close();
			}
			catch(Exception ex)
			{
				System.out.print(ex.getMessage());
			}
		}
		return result;
	}
	public String mostrarArticulo() {
		String sentencia = "SELECT descripcion_post FROM tb_post WHERE id_cat=1";
		conexion con = new conexion();
		ResultSet rs = null;
		int cont=0;
		String resultado = "<table><th>#</th><th>Articulos</th>";
		try {
			rs = con.Consulta(sentencia);
			while (rs.next()) {
				cont++;
				resultado += "<tr><td>" + cont+ "</td>"
						+ "<td>" + rs.getString(1) + "</td>";
			}
			resultado += "</table>";
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return resultado;
	}

	public String mostrarConsejo() {
		String sentencia = "SELECT descripcion_post FROM tb_post WHERE id_cat=2";
		conexion con = new conexion();
		ResultSet rs = null;
		int cont=0;
		String resultado = "<table><th>#</th><th>Consejos</th>";
		try {
			rs = con.Consulta(sentencia);
			while (rs.next()) {
				cont++;
				resultado += "<tr><td>" + cont+ "</td>"
						+ "<td>" + rs.getString(1) + "</td>";
			}
			resultado += "</table>";
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return resultado;
	}

	public int getId_post() {
		return id_post;
	}
	public void setId_post(int id_post) {
		this.id_post = id_post;
	}
	public int getId_cat() {
		return id_cat;
	}
	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}
	public String getDescripcion_post() {
		return descripcion_post;
	}
	public void setDescripcion_post(String descripcion_post) {
		this.descripcion_post = descripcion_post;
	}


}
