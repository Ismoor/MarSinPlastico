<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.web.seguridad.*"%>
<%
	String correo = request.getParameter("email");
	String clave = request.getParameter("password");
	usuario usuario = new usuario();

    boolean respuesta = usuario.verificarInicioSesion(correo, clave);

    if (respuesta) {
        // Sesión exitosa
        HttpSession sesion = request.getSession();
        sesion.setAttribute("usuario", usuario.getNombre());
        sesion.setAttribute("perfil", usuario.getId_per());
        sesion.setAttribute("id_us", usuario.getId_us());
        sesion.setAttribute("clave", usuario.getClave());
        if(usuario.getId_per()==1){
            response.sendRedirect("menuAdmin.jsp");
        } else if(usuario.getId_per()==2){
            response.sendRedirect("menuUsuario.jsp");
        }
    } else {
        // Sesión fallida
        response.sendRedirect("login.jsp?error=Datos incorrectos. Vuelva a intentarlo.");
    }
%>