<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="model.entity.*"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<% Access access = (Access)request.getAttribute("access");%>
<% UserService us = UserServiceFactory.getUserService(); %>
<% SimpleDateFormat created=new SimpleDateFormat("yyyy-MM-dd - HH:mm:ss");%>
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
				<p><a href="../users/index" class="botselec">Users</a></p>
			    <p><a href="../resources/index" class="botselec">Resources</a></p>
			    <p id="selec"><a href="../access/index" class="botselec" id="sel">Access</a></p>
			    <p><a href="<%= us.createLogoutURL("/gmail")%>" class="botselec">Salir</a></p>   
			</div>
			<div id="contenido">
				<table border="1">
					<tr>
						<td colspan="2" class="titulo">Datos</td>
					<tr>
						<td class="titulo">ID</td>
						<td><%= access.getId() %></td>
					<tr>
						<td class="titulo">ID Role</td>
						<td><%= access.getIdRole() %></td>
					<tr>
						<td class="titulo">Id Resource</td>
						<td><%= access.getIdResource() %></td>
					<tr>
						<td class="titulo">Status</td>
						<td><%= access.isStatus() %></td>
					<tr>
						<td class="titulo">Fecha de creacion</td>
						<td><%= created.format(access.getCreated()) %></td>
					<tr>
						<td class="border"><input type="button" onclick = "location='/access/index'" value="Volver atras" class="boton">
						<td class="border"><a href="/access/update?id=<%= access.getId() %>" class="boton">Editar</a>   <a href="/access/delete?id=<%= access.getId() %>" class="eli">Eliminar</a>	
				</table>
			</div>
		</div>
	</body>
</html>