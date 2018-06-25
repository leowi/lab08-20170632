<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>
<%List<Role> roles =(List<Role>)request.getAttribute("roles");%>
<%List<Resource> resources =(List<Resource>)request.getAttribute("resources");%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%UserService us = UserServiceFactory.getUserService(); %>
<%String mensaje=(String)request.getAttribute("mensaje"); %>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../estilo.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>New Access</title>
	</head>
	<body>
	<form action="/access/add" method="GET">
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
				<table>
					<tr>
						<td colspan="2" class="titulo">New Access</td>
					<%if(mensaje!=null){ %>
					<tr>
						<td colspan="2" id="alerta"><%=mensaje%></td>
					<%} %>
					<tr>
						<td class="titulo"><label>Role: </label>
						<td><select name="role">
							<option selected value="0">Elige una opcion</option>
							<% for (int i = 0;i<roles.size();i++) { %>
							<% Role r = (Role)roles.get(i); %>
							<option value="<%=r.getId() %>"><%=r.getName() %></option>
							<%} %>
							</select>
					<tr>
						<td class="titulo"><label>Resource: </label>
						<td ><select name="resource">
							<option selected value="0">Elige una opcion</option>
							<% for (int i = 0;i<resources.size();i++) { %>
							<% Resource r = (Resource)resources.get(i); %>
							<option value="<%=r.getId() %>"><%=r.getUrl() %></option>
							<%} %>
							</select>
					<tr >
						<td class="border"><input type="button" onclick = "location='/access/index'" value="Volver atras" class="boton">
						<td class="border"><input type="submit" value="Crear" class="boton">
					
				</table>
			</div>
		</div>
	</form>
</body>
</html>