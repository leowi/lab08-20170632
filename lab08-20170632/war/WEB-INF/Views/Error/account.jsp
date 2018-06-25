<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%UserService us = UserServiceFactory.getUserService(); %>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../estilo.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Error</title>
	</head>
	<body>
		<table>
			<tr>
				<td class="border">No ingreso ninguna cuenta
			<tr>
				<td class="border"><a href="<%= us.createLoginURL("/gmail")%>" class="boton">Ingresar</a>	
		</table>
	</body>
</html>