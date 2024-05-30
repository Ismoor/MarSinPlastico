<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.negocio.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mar sin plastico</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<header>
		<h1>Mar sin plastico</h1>
	</header>
	<nav>
		<ul>
			<li><a href="menuAprobar.jsp">Atras</a></li>
		</ul>
	</nav>
	<section class="main-section"></section>
	<article>
		<% 
	int cod = Integer.parseInt(request.getParameter("cod"));
	comentarios c = new comentarios();
	boolean f = c.eliminarComentario(cod);
	if(f==true){
	%>
	<p>El comentario se elimino correctamente.</p>
	<%
	} else {
		%>
	<p>El comentario no se elimino.</p>
	<% 
	}

%>
	</article>

	<footer>
		<h3>Síguenos en nuestras redes sociales</h3>
		<ul>
			<li><a href="https://www.facebook.com/miltonismael.peralta"><img
					src="imagenes/facebook.png" alt="Facebook"></a></li>
			<li><a href="https://www.instagram.com/ismoor_pera"> <img
					src="imagenes/instagram.png" alt="Instagram"></a></li>
			<li><a href="https://x.com/VanN0097"><img
					src="imagenes/x.png" alt="X"></a></li>
			<li><a
				href="https://www.linkedin.com/in/milton-peralta-5a7482307?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app"><img
					src="imagenes/linkedin.png" alt="LinkedIn"></a></li>

		</ul>
	</footer>
</body>
</html>