<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%UserService us = UserServiceFactory.getUserService(); %>
<%List<Resource> resources =(List<Resource>)request.getAttribute("resources");%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../estilo.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Resources</title>
	</head>
	<body>
		<div id="principal" >
			<div id="cuenta">
			    <p><%= us.getCurrentUser() %></p>    
			</div>
			<div id="menu">
			    <p><a href="../roles/index" class="botselec">Roles</a></p>
				<p><a href="../users/index" class="botselec">Users</a></p>
			    <p id="selec"><a href="../resources/index" id="sel" class="botselec">Resources</a></p>
			    <p><a href="../access/index" class="botselec">Access</a></p>
			    <p><a href="<%= us.createLogoutURL("/gmail")%>" class="botselec">Salir</a></p> 
			</div>
			<div id="contenido">
			<% if (resources.size() > 0) { %>
				<table >
					<tr>
						<td colspan="4" class="titulo">Lista de Resources</td>
					<tr>
						<td colspan="4" class="titulo">Numero de Roles: <%= resources.size() %></td>
					<tr>
						<td class="titulo">URL
						<td class="titulo">ID
						<td class="titulo">Status
						<td class="titulo">Opciones
					<% for (int i = 0;i<resources.size();i++) { %>
					<% Resource r = (Resource)resources.get(i); %>
					<tr>
						<td><%=r.getUrl() %>
						<td><%=r.getId() %>
						<td <%if(r.isStatus()==false){ %> id="alerta"<%} %>><%=r.isStatus() %>
						<td><a href="/resources/view?id=<%= r.getId() %>" class="boton">ver mas</a>
							<a href="/resources/update?id=<%= r.getId() %>" class="boton">editar</a>
							<a href="/resources/delete?id=<%= r.getId() %>" class="eli">eliminar</a>
					<% } %>
					<tr>
						<td class="border"><input type="button" onclick = "location='/resources/add'" value="Crear nuevo" class="boton">	
				</table>
			<% } else { %>
				<table>
					<tr>
						<td class="border">No existen datos
					<tr>
						<td class="border"><a href="/resources/add" class="boton"> Crear nuevo</a>	
				</table>
			<% } %>
			</div>
		</div>
	</body>
</html>