<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%List<Role> roles =(List<Role>)request.getAttribute("roles");%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%UserService us = UserServiceFactory.getUserService(); %>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../estilo.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Permisos</title>
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
			    <p><a href="../access/index" class="botselec">Access</a></p>
			    <p><a href="<%= us.createLogoutURL("/gmail")%>" class="botselec">Salir</a></p>
			</div>
			<div id="contenido">
				<table>
					<tr>
						<td class="border">No puedes eliminarte a ti mismo XDXDXD
					<tr>
						<td class="border"><input type="button" onclick="history.back()" value="Regresar" class="boton">	
				</table>
			</div>
		</div>
	</form>
</body>
</html>