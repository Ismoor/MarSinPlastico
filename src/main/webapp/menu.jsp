<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="com.web.seguridad.*"%>
<%
String usuario="";
HttpSession sesion = request.getSession();
 if (sesion.getAttribute("usuario") == null) //Se verifica si existe la variable
 {
 %>
<jsp:forward page="login.jsp">
	<jsp:param name="error" value="Debe registrarse en el sistema." />
</jsp:forward>
<%
 }
 else
 {
 usuario=(String)sesion.getAttribute("usuario"); //Se devuelve los valores de atributos
 int perfil=(Integer)sesion.getAttribute("perfil");
 %>
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
			<li><a href="cerrarSesion.jsp">Cerrar sesion</a></li>
			<%
				pagina pag=new pagina();
				String menu=pag.mostrarMenu(perfil);
				out.print(menu);
			%>
		</ul>
	</nav>
	<section class="main-section">
	<article>
			<h1>Sitio Privado de "Mar sin plastico"</h1>
			<h4>
				Bienvenido
				<%
					out.println(usuario);
					
				%>
			</h4>
				<%
					
					out.print(menu);
 				}
				%>
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