<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="model.entity.*"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<% UserService us = UserServiceFactory.getUserService(); %>
<% Resource resource = (Resource)request.getAttribute("resource");%>
<%String id =(String)request.getAttribute("id");%>
<% SimpleDateFormat created=new SimpleDateFormat("yyyy-MM-dd - HH:mm:ss");%>
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
				<p><a href="../users/index" class="botselec">Users</a></p>
			    <p id="selec"><a href="../resources/index" id="sel" class="botselec">Resources</a></p>
			    <p><a href="../access/index" class="botselec">Access</a></p>
			    <p><a href="<%= us.createLogoutURL("/gmail")%>" class="botselec">Salir</a></p> 
			</div>
			<div id="contenido">
				<form action="/resources/update" method="GET">
					<input type="hidden" name="id" value="<%=id %>">
					<table>
						<tr class="titulo">
							<td colspan="2" >Editar Datos</td>
						<%if(mensaje!=null){ %>
						<tr>
							<td colspan="2" id="alerta"><%=mensaje%></td>
						<%} %>
						<tr>
							<td class="titulo">ID</td>
							<td><%= resource.getId() %></td>
						<tr>
							<td class="titulo">URL</td>
							<td><input type="text" name="url" required autofocus value="<%=resource.getUrl() %>">
						<tr>
							<td class="titulo">Status</td>
							<td ><select name="status">
							<% if(resource.isStatus()) { %>
								<option selected value="true">true</option>
								<option value="false">false</option>
							<%}else{ %>
								<option selected value="false">false</option>
								<option value="true">true</option>
							<%} %>
							</select>
						<tr>
							<td class="titulo">Fecha de creacion</td>
							<td><%= created.format(resource.getCreated()) %></td>
						<tr>
							<td class="border"><input type="button" onclick = "location='/resources/index'" value="Volver atras" class="boton">
							<td class="border"><input type="submit" value="Guardar" class="boton">
					</table>
				</form>
			</div>
		</div>

	</body>
</html>