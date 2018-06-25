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
<%String id =(String)request.getAttribute("id");%>
<%UserService us = UserServiceFactory.getUserService(); %>
<%List<Role> roles =(List<Role>)request.getAttribute("roles");%>
<%String mensaje=(String)request.getAttribute("mensaje"); %>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../estilo.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Editar Datos</title>
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
				<form action="/users/update" method="GET">
					<input type="hidden" name="id" value="<%=id %>">
					<table >
						<tr>
							<td colspan="2" class="titulo">Editar Datos</td>
						<%if(mensaje!=null){ %>
						<tr>
							<td colspan="2" id="alerta"><%=mensaje%></td>
						<%} %>
						<tr>
							<td class="titulo">ID</td>
							<td><%= user.getId() %></td>
						<tr>
							<td class="titulo">Nombre</td>
							<td><input type="text" name="name" required autofocus value="<%=user.getName() %>">
						<tr>
							<td class="titulo">Cargo</td>
							<td><input type="text" name="position" required value="<%=user.getPosition() %>">
						<tr>
							<td class="titulo">Especialidad</td>
							<td><input type="text" name="specialty" required value="<%=user.getSpecialty() %>">
						<tr>
							<td class="titulo">Gmail</td>
							<td><input type="text" name="email" required value="<%= user.getEmail() %>">
						<tr>
							<td class="titulo">Fecha de nacimiento</td>
							<td ><input type="date" name="birth" required value="<%= birth.format(user.getBirth()) %>">
						<tr>
							<td class="titulo">Genero</td>
							<td ><select name="gender">
								<% if(user.getGender().equals("Hombre")) { %>
									<option selected value="Hombre">Hombre</option>
									<option value="Mujer">Mujer</option>
								<%}else{ %>
									<option selected value="Mujer">Mujer</option>
									<option value="Hombre">Hombre</option>
								<%} %>
								</select>
						<tr>
							<td class="titulo">DNI</td>
							<td><input type="text" name="DNI" required value="<%= user.getDNI() %>" required pattern="[0-9]{8}">
						<tr>
							<td class="titulo">Telefono</td>
							<td><input type="text" name="phone" required value="<%= user.getPhone() %>" required pattern="[0-9]{9}">
						<tr>
							<td class="titulo">Direccion</td>
							<td><input type="text" name="address" required value="<%= user.getAddress() %>">
						<tr>
							<td class="titulo">Id role</td>
							<td ><select name="role">
								<option selected value="0">--------</option>
								<% for (int i = 0;i<roles.size();i++) { %>
								<% Role r = (Role)roles.get(i); %>
								<option value="<%=r.getId() %>" <%if(user.getIdRole().equals(r.getId())){ %>selected<%} %>><%=r.getName() %></option>
								<%} %>
								</select>
						<tr>
							<td class="titulo">Estado</td>
							<td ><select name="status">
								<% if(user.isStatus()) { %>
									<option selected value="true">true</option>
									<option value="false">false</option>
								<%}else{ %>
									<option selected value="false">false</option>
									<option value="true">true</option>
								<%} %>
								</select>
						<tr>
							<td class="titulo">Fecha de creacion</td>
							<td><%= created.format(user.getCreated()) %></td>
						<tr>
							<td class="border"><input type="button" onclick = "location='/users/index'" value="Volver atras" class="boton">
							<td class="border"><input type="submit" value="Guardar" class="boton">
							
					</table>
				</form>
			</div>
		</div>

	</body>
</html>