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
<%String id =(String)request.getAttribute("id");%>
<%List<Role> roles =(List<Role>)request.getAttribute("roles");%>
<%List<Resource> resources =(List<Resource>)request.getAttribute("resources");%>
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
			    <p><a href="../resources/index" class="botselec">Resources</a></p>
			    <p id="selec"><a href="../access/index" class="botselec" id="sel">Access</a></p>
			    <p><a href="<%= us.createLogoutURL("/gmail")%>" class="botselec">Salir</a></p>   
			</div>
			<div id="contenido">
				<form action="/access/update" method="GET">
					<input type="hidden" name="id" value="<%=id %>">
					<table border="1">
						<tr>
							<td colspan="2" class="titulo">Editar Datos</td>
						<%if(mensaje!=null){ %>
						<tr>
							<td colspan="2" id="alerta"><%=mensaje%></td>
						<%} %>
						<tr>
							<td class="titulo">ID</td>
							<td><%= access.getId() %></td>
						<tr>
							<td class="titulo">ID Role</td>
							<td><select name="role">
							<option  value="0">--------</option>
							<% for (int i = 0;i<roles.size();i++) { %>
							<% Role ro = (Role)roles.get(i); %>
							<option value="<%=ro.getId() %>" <%if(access.getIdRole().equals(ro.getId())){ %>selected<%} %>><%=ro.getName() %></option>
							<%} %>
							</select>
						<tr>
							<td class="titulo">Id Resource</td>
							<td ><select name="resource">
							<option selected value="0">--------</option>
							<% for (int i = 0;i<resources.size();i++) { %>
							<% Resource re = (Resource)resources.get(i); %>
							<option value="<%=re.getId() %>" <%if(access.getIdResource().equals(re.getId())){ %>selected<%} %>><%=re.getUrl() %></option>
							<%} %>
							</select>
						<tr>
							<td class="titulo">Status</td>
							<td ><select name="status">
							<% if(access.isStatus()) { %>
								<option selected value="true">true</option>
								<option value="false">false</option>
							<%}else{ %>
								<option selected value="false">false</option>
								<option value="true">true</option>
							<%} %>
							</select>
						<tr>
							<td class="titulo">Fecha de creacion</td>
							<td><%= created.format(access.getCreated()) %></td>
						<tr>
							<td class="border"><input type="button" onclick = "location='/access/index'" value="Volver atras" class="boton">
							<td class="border"><input type="submit" value="Guardar" class="boton">	
					</table>
				</form>
			</div>
		</div>
	</body>
</html>