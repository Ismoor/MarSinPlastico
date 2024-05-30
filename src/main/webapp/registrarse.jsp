<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
            <div class="registro-box">
                <h2>Datos Personales</h2>
                <form action="respuesta.jsp" method="post">
                    <label for="nombre">Nombre:</label> 
                    <input type="text" name="txtnombre" required><br> <br> 
                    <label for="cedula">Número de Cédula:</label> 
                    <input type="text" name="cedula" maxlength="10" required><br> <br>
                    <label for="cmbECivil">Estado Civil:</label> 
                    <select name="cmbECivil">
                        <option value="1">Soltero</option>
                        <option value="2">Casado</option>
                        <option value="3">Divorciado</option>
                        <option value="4">Viudo</option>
                    </select><br> <br> 
                    <label for="correo">Correo Electrónico:</label>
                    <input type="email" name="correo" required><br> <br>
                    <label for="clave">Clave:</label> 
                    <input type="password" name="clave" minlength="6" required><br> <br>
                    <button type="submit">Registrar usuario</button>
                    <button type="reset">Limpiar</button>
                </form>
            </div>
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