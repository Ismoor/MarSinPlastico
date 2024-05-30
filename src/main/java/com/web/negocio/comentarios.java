package com.web.negocio;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.web.datos.conexion;

public class comentarios {
	private int id_com;
	private String descripcion_com;
	private int aprobado;
	
	public comentarios(int id_com, String descripcion_com, int aprobado) {
		super();
		this.id_com = id_com;
		this.descripcion_com = descripcion_com;
		this.aprobado = aprobado;
	}
	public comentarios() {
	}
	
	public comentarios bComentario(int id_com) {
		String sentencia = "SELECT id_com, descrpicion_com, aprobado FROM tb_comentarios WHERE id_com="+id_com;
		conexion con = new conexion();
		comentarios c = new comentarios();
		int id=0;
		String desc="";
		int apro=0;
		ResultSet rs = null;
		try {
			rs = con.Consulta(sentencia);
			while (rs.next()) {
				id = rs.getInt(1);
				desc = rs.getString(2);
				apro = rs.getInt(3);
			}
			c = new comentarios(id, desc, apro);
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return c;
	}
	
	public String buscarComentario() {
		String sentencia = "SELECT descripcion_com, id_com FROM tb_comentarios WHERE aprobado=0";
		conexion con = new conexion();
		ResultSet rs = null;
		String resultado = "<table><th>ID</th><th>Comentario</th>";
		try {
			rs = con.Consulta(sentencia);
			while (rs.next()) {
				resultado += "<tr><td>" + rs.getInt(2)+ "</td>"
						+ "<td>" + rs.getString(1) + "</td>"
						+ "<td> <a href= aprobar.jsp?cod=" + rs.getInt(2)
						+ "><pre style=\"text-align: center\">Aprobar</pre></a></td>"
						+ "<td> <a href= eliminar.jsp?cod=" + rs.getInt(2)
						+ " \"><pre style=\"textalign: center\">Eliminar</pre></a></td></tr>"
						;
			}
			resultado += "</table>";
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return resultado;
	}
	
	public String mostrarComentario() {
		String sentencia = "SELECT descripcion_com FROM tb_comentarios WHERE aprobado=1";
		conexion con = new conexion();
		ResultSet rs = null;
		int cont=0;
		String resultado = "<table><th>#</th><th>Comentarios</th>";
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
	
	public boolean aprobarComentario (int id_com) {
		boolean agregado = false;
		conexion obj = new conexion();
		String sql = "UPDATE tb_comentarios SET aprobado=1"
		+ " WHERE id_com = "+id_com ;
		try {
			obj.Ejecutar (sql);
			agregado = true;
		} catch (Exception e) {
			agregado = false;
		}
		return agregado;
	}
	
	public boolean eliminarComentario(int cod) {
		boolean f=false;
		conexion con = new conexion();
		String sql = "delete from tb_comentarios where id_com = '"+cod+"'";
		try {
			con.Ejecutar(sql);
			f = true;
		} catch(Exception e) {
			f = false;
		}
		return f;
	}

	public String ingresarComentario(String desc)
	{
		String result="";
		int apr=0;
		conexion con=new conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_comentarios ("
				+ "descripcion_com, aprobado)"
				+ "VALUES(?,?)";
		try{
			pr=con.getCon().prepareStatement(sql);
			pr.setString(1,desc);
			pr.setInt(2, apr);
			if(pr.executeUpdate()==1)
			{
				result="Se mando a revision correctamente.";
			}
			else
			{
				result="No se ingreso el comentario.";
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
	
	public int getId_com() {
		return id_com;
	}
	public void setId_com(int id_com) {
		this.id_com = id_com;
	}
	public String getDescripcion_com() {
		return descripcion_com;
	}
	public void setDescripcion_com(String descripcion_com) {
		this.descripcion_com = descripcion_com;
	}
	public int getAprobado() {
		return aprobado;
	}
	public void setAprobado(int aprobado) {
		this.aprobado = aprobado;
	}
	
	
}
