<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%UserService us = UserServiceFactory.getUserService(); %>
<%List<Role> roles =(List<Role>)request.getAttribute("roles");%>
<%String mensaje=(String)request.getAttribute("mensaje"); %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../estilo.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>New Role</title>
	</head>
	<body>
		<form action="/users/add" method="GET">
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
				<table>
					<tr class="titulo">
						<td colspan="2">New User</td>
					<%if(mensaje!=null){ %>
					<tr>
						<td colspan="2" id="alerta"><%=mensaje%></td>
					<%} %>
					<tr>
						<td class="titulo"><label>Nombre: </label>
						<td ><input type="text" name="name" autofocus required value="Dr. Jose Arias" >
					<tr>
						<td class="titulo"><label>Cargo: </label>
						<td ><input type="text" name="position" required value="Odontologo Principal" >
					<tr>
						<td class="titulo"><label>Especialidad: </label>
						<td ><input type="text" name="specialty" required value="Perodoncia e implantes">
					<tr>
						<td class="titulo"><label>Email: </label>
						<td ><input type="text" name="email" required value="cualquiera@gmail.com">
					<tr>
						<td class="titulo"><label>Fecha de nacimiento: </label>
						<td ><input type="date" name="birth" required value="2001-09-11">
					<tr>
						<td class="titulo"><label>Genero: </label>
						<td ><select name="gender">
							<option selected value="Hombre">Hombre</option>
							<option value="Mujer">Mujer</option></select>
					<tr>
						<td class="titulo"><label>DNI: </label>
						<td ><input type="text" name="DNI" required pattern="[0-9]{8}" value="12345678" title="Ingrese ocho digitos">
					<tr>
						<td class="titulo"><label>Telefono: </label>
						<td ><input type="text" name="phone" required pattern="[0-9]{9}" value="123456789" title="Ingrese nueve digitos">
					<tr>
						<td class="titulo"><label>Direccion: </label>
						<td ><input type="text" name="address" required value="Calle Aleatoria 322" >
					<tr>
						<td class="titulo"><label>Role: </label>
						<td ><select name="role">
							<option selected value="0">Elige una opcion</option>
							<% for (int i = 0;i<roles.size();i++) { %>
							<% Role r = (Role)roles.get(i); %>
							<option value="<%=r.getId() %>"><%=r.getName() %></option>
							<%} %>
							</select>
					<tr>
						<td class="border"><input type="button" onclick="location='/users/index'" value="Volver atras" class="boton">
						<td class="border"><input type="submit" value="Crear" class="boton">
					
				</table>
			</div>
		</div>
	</form>
</body>
</html>