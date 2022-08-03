<%@page import="model.Localidad"%>
<%@page import="dao.LocalidadDAOC"%>
<%@page import="model.Pedido"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
	String nombre =request.getParameter("firstName");
	String apellido =request.getParameter("lastName");
	String usuario =request.getParameter("username");
	String mail =request.getParameter("email");
	String lugarentrega =request.getParameter("address");
	String idLocalidad = request.getParameter("country");
	String codpostal =request.getParameter("zip");
	String formadepago =request.getParameter("paymentMethod");
	String tarjtitular =request.getParameter("cc-name");
	String tarjnumero =request.getParameter("cc-number");
	String tarjvto =request.getParameter("cc-expiration");
	String tarjclave =request.getParameter("cc-cvv");
	
	LocalidadDAOC localidadDAOC = new LocalidadDAOC();
	Localidad localidad = localidadDAOC.getLocalidadXID(Integer.valueOf(idLocalidad));
	
	//Pedido pedido = new Pedido(nombre, apellido, usuario, mail, lugarentrega, localidad, codpostal, formadepago, tarjtitular, tarjnumero, tarjvto, tarjclave);
	
	%>

</body>
</html>