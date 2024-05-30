<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.web.seguridad.*"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mar sin plastico</title>
<link rel="stylesheet" href="css/menu.css">
</head>
<body>
	<header>
		<h1>Mar sin plastico</h1>
	</header>
	<nav>
		<ul>
			<li><a href="index.jsp">Atras</a></li>
		</ul>
	</nav>
	<section class="main-section">
		<article>
			<%
			String estad = "";
			String nombre = request.getParameter("txtnombre");
			String cedula = request.getParameter("cedula");
			int estadoCivil = Integer.parseInt(request.getParameter("cmbECivil"));
			String correo = request.getParameter("correo");
			String clave = request.getParameter("clave");
			int id_per = 2; // Valor predeterminado o asigna un valor válido si es necesario

			// Verificar si el parámetro no es null antes de intentar convertirlo
			String id_perParam = request.getParameter("id_per");
			if (id_perParam != null && !id_perParam.isEmpty()) {
				id_per = Integer.parseInt(id_perParam);
			}

			usuario usuario = new usuario(id_per, estadoCivil, nombre, cedula, correo, clave);
			String resultado = usuario.ingresarCliente();
			if (usuario.getEstado() == 1) {
				estad = "Soltero";
			} else if (usuario.getEstado() == 2) {
				estad = "Casado";
			} else if (usuario.getEstado() == 3) {
				estad = "Divorciado";
			} else if (usuario.getEstado() == 4) {
				estad = "Viudo";
			}
			%>
			<p>
				Su nombre es
				<%=nombre%></p>
			<p>
				Su cédula es
				<%=cedula%></p>
			<p>
				Su estado civil es
				<%=estad%></p>
			<p>
				Su correo electrónico es
				<%=correo%></p>

			<p>
				Resultado del registro de usuario:
				<%=resultado%></p>
		</article>
	</section>


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