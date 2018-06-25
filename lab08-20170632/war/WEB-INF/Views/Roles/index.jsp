<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%UserService us = UserServiceFactory.getUserService(); %>
<%List<Role> roles =(List<Role>)request.getAttribute("roles");%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../estilo.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Roles</title>
	</head>
	<body>
		<div id="principal" >
			<div id="cuenta">
			    <p><%= us.getCurrentUser() %></p>    
			</div>
			<div id="menu">
			    <p  id="selec"><a href="../roles/index" id="sel" class="botselec">Roles</a></p>
				<p><a href="../users/index" class="botselec">Users</a></p>
			    <p><a href="../resources/index" class="botselec">Resources</a></p>
			    <p><a href="../access/index" class="botselec">Access</a></p>
			    <p><a href="<%= us.createLogoutURL("/gmail")%>" class="botselec">Salir</a></p>  
			</div>
			<div id="contenido">
			<% if (roles.size() > 0) { %>
				<table>
					<tr>
						<td colspan="4" class="titulo">Lista de Roles</td>
					<tr>
						<td colspan="4" class="titulo">Numero de Roles: <%= roles.size() %></td>
					<tr>
						<td class="titulo">Nombre
						<td class="titulo">ID
						<td class="titulo">Status
						<td class="titulo">Opciones
					<% for (int i = 0;i<roles.size();i++) { %>
					<% Role d = (Role)roles.get(i); %>
					<tr>
						<td><%=d.getName() %>
						<td><%=d.getId() %>
						<td <%if(d.isStatus()==false){ %> id="alerta"<%}%>><%=d.isStatus() %>
						<td><a href="/roles/view?id=<%= d.getId() %>" class="boton">ver mas</a>
							<a href="/roles/update?id=<%= d.getId() %>" class="boton">editar</a>
							<a href="/roles/delete?id=<%= d.getId() %>" class="eli">eliminar</a>
					<% } %>
					<tr>
						<td class="border"><input type="button" onclick = "location='/roles/add'" value="Crear nuevo" class="boton">	
				</table>
			<% } else { %>
				<table>
					<tr>
						<td class="border">No existen datos
					<tr>
						<td class="border"><a href="/roles/add" class="boton"> Crear nuevo</a>	
				</table>
			<% } %>
			</div>
		</div>
	</body>
</html>