<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%List<UserJava> users =(List<UserJava>)request.getAttribute("users");
UserJava uj=(UserJava)request.getAttribute("u");
%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%UserService us = UserServiceFactory.getUserService(); %>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../estilo.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Users</title>
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
			<% if (users.size() > 0) { %>
				<table>
					<tr class="titulo">
						<td colspan="4" class="titulo">Lista de Users</td>
					<tr class="titulo">
						<td colspan="4">Numero de Users: <%= users.size() %></td>
					<tr class="titulo">
						<td class="titulo">Nombre
						<td class="titulo">Role
						<td class="titulo">Status
						<td class="titulo">Opciones
					<% for (int i = 0;i<users.size();i++) { %>
					<% UserJava u = (UserJava)users.get(i); %>
					<tr>
						<td><%=u.getEmail() %>
						<td><%=Role.exist(u.getIdRole()) %>
						<td <%if(u.isStatus()==false){ %> id="alerta"<%}%>><%=u.isStatus()%>
						<td><a href="/users/view?id=<%= u.getId() %>" class="boton">ver mas</a>
							<a href="/users/update?id=<%= u.getId() %>" class="boton">editar</a>
							<a href="/users/delete?id=<%= u.getId() %>" class="eli">eliminar</a>
					<% } %>
					<tr>
						<td class="border"><input type="button" onclick = "location='/users/add'" value="Crear nuevo" class="boton">	
				</table>
			<% } else { %>
				<table>
					<tr>
						<td class="border">No existen datos
					<tr>
						<td class="border"><a href="/users/add" class="boton"> Crear nuevo</a>	
				</table>
			<% } %>	
			</div>
		</div>
	</body>
</html>