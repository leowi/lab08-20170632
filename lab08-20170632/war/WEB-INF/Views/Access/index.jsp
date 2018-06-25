<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%List<Access> access =(List<Access>)request.getAttribute("access");%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%UserService us = UserServiceFactory.getUserService(); %>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../estilo.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Access</title>
	</head>
	<body>
		<div id="principal" >
			<div id="cuenta">
			    <p><%= us.getCurrentUser() %></p>    
			</div>
			<div id="menu">
			    <p><a href="../roles/index" class="botselec">Roles</a></p>
				<p><a href="../users/index" class="botselec">Users</a></p>
			    <p><a href="../resources/index" class="botselec">Resources</a></p>
			    <p id="selec"><a href="../access/index" class="botselec" id="sel">Access</a></p>
			    <p><a href="<%= us.createLogoutURL("/gmail")%>" class="botselec">Salir</a></p>   
			</div>
			<div id="contenido">
			<% if (access.size() > 0) { %>
				<table>
					<tr>
						<td colspan="4" class="titulo">Lista de Access</td>
					<tr>
						<td colspan="4" class="titulo">Numero de Access: <%= access.size() %></td>
					<tr>
						<td class="titulo">Role
						<td class="titulo">Resource
						<td class="titulo">Status
						<td class="titulo">Opciones
					<% for (int i = 0;i<access.size();i++) { %>
					<% Access u = (Access)access.get(i); %>
					<tr>
						<td><%=Role.exist(u.getIdRole()) %>
						<td><%=Resource.exist(u.getIdResource()) %>
						<td <%if(u.isStatus()==false){ %> id="alerta"<%}%>><%=u.isStatus() %>
						<td><a href="/access/view?id=<%= u.getId() %>" class="boton">ver mas</a>
							<a href="/access/update?id=<%= u.getId() %>" class="boton">editar</a>
							<a href="/access/delete?id=<%= u.getId() %>" class="eli">eliminar</a>
					<% } %>
					<tr>
						<td class="border"><input type="button" onclick = "location='/access/add'" value="Crear nuevo" class="boton">	
				</table>
			<% } else { %>
				<table>
					<tr>
						<td class="border">No existen datos
					<tr>
						<td class="border"><a href="/access/add" class="boton"> Crear nuevo</a>	
				</table>
			<% } %>
			</div>
		</div>
	</body>
</html>