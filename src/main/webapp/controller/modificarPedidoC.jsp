<%@page import="dao.PedidoDAOC"%>
<%@page import="model.Localidad"%>
<%@page import="model.Provincia"%>
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
String id = request.getParameter("id");
String nombre = request.getParameter("firstName");
String apellido = request.getParameter("lastName");
String usuario = request.getParameter("username");


PedidoDAOC dao = new PedidoDAOC();
//TODO: 	Populate pedido con datos del formualrio
Integer.valueOf(id);
Pedido pedido = dao.getPedidoXID(Integer.valueOf(id));

pedido.setNombre("CCCC");


Boolean udpOk = dao.udpPedido(pedido);
if(udpOk) {
	response.sendRedirect("../view/mensajeOk.jsp");
}else {
	response.sendRedirect("../view/mensajeError.jsp");
}



%>
</body>
</html>