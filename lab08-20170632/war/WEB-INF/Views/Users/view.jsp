<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="model.entity.*"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<% UserJava user = (UserJava)request.getAttribute("user");%>
<% SimpleDateFormat birth=new SimpleDateFormat("yyyy-MM-dd");%>
<% SimpleDateFormat created=new SimpleDateFormat("yyyy-MM-dd - HH:mm:ss");%>
<%UserService us = UserServiceFactory.getUserService(); %>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../estilo.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Datos</title>
	</head>
	<body>
		<div id="principal" >
			<div id="cuenta">
			    <p><%= us.getCurrentUser() %></p>    
			</div>
			<div id="menu">
			    <p><a href="../roles/index" class="botselec">Roles</a></p>
				<p id="selec"><a href="../users/index" id="sel" class="botselec">Users</a></p>
			    <p><a href="../resources/index" class="botselec">Resources</a></p>
			    <p><a href="../access/index" class="botselec">Access</a></p>
			    <p ><a href="<%= us.createLogoutURL("/gmail")%>" class="botselec">Salir</a></p>   
			</div>
			<div id="contenido">
				<table >
					<tr>
						<td colspan="2" class="titulo">Datos</td>
					<tr>
						<td class="titulo">ID</td>
						<td><%= user.getId() %></td>
					<tr>
						<td class="titulo">Nombre</td>
						<td><%= user.getName() %></td>
					<tr>
						<td class="titulo">Cargo</td>
						<td><%= user.getPosition() %></td>
					<tr>
						<td class="titulo">Especialidad</td>
						<td><%= user.getSpecialty() %></td>
					<tr>
						<td class="titulo">Gmail</td>
						<td><%= user.getEmail() %></td>
					<tr>
						<td class="titulo">Fecha de nacimiento</td>
						<td><%= birth.format(user.getBirth()) %></td>
					<tr>
						<td class="titulo">Genero</td>
						<td><%= user.getGender() %></td>
					<tr>
						<td class="titulo">DNI</td>
						<td><%= user.getDNI() %></td>
					<tr>
						<td class="titulo">Telefono</td>
						<td><%= user.getPhone() %></td>
					<tr>
						<td class="titulo">Direeccion</td>
						<td><%= user.getAddress() %></td>
					<tr>
						<td class="titulo">Id role</td>
						<td><%= user.getIdRole() %></td>
					<tr>
						<td class="titulo">Estado</td>
						<td><%= user.isStatus() %></td>
					<tr>
						<td class="titulo">Fecha de creacion</td>
						<td><%= created.format(user.getCreated()) %></td>
					<tr>
						<td class="border"><input type="button" onclick = "location='/users/index'" value="Volver atras" class="boton">
						<td class="border"><a href="/users/update?id=<%= user.getId() %>" class="boton">editar</a>   <a href="/users/delete?id=<%= user.getId() %>" class="eli">eliminar</a>
				</table>
			</div>
		</div>

	</body>
</html>