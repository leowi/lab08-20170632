<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%UserService us = UserServiceFactory.getUserService(); %>
<%String mensaje=(String)request.getAttribute("mensaje"); %>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../estilo.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>New Resource</title>
	</head>
	<body>
	<form action="/resources/add" method="GET">
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
				<table>
					<tr>
						<td colspan="2" class="titulo">New Resource</td>
					<%if(mensaje!=null){ %>
					<tr>
						<td colspan="2" id="alerta"><%=mensaje%></td>
					<%} %>
					<tr>
						<td class="titulo"><label>URL: </label>
						<td ><input type="text" name="url" autofocus required >
					<tr>
						<td class="border"><input type="button" onclick = "location='/resources/index'" value="Volver atras" class="boton">
						<td class="border"><input type="submit" value="Crear" class="boton">
					
				</table>
			</div>
		</div>
	</form>
</body>
</html>