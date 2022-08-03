<%@page import="dao.UsuarioDAOC"%>
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
	try{
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		
		UsuarioDAOC daoc = new UsuarioDAOC();
		Boolean ok = daoc.guardarUsuario(user, pass);
		
		if(ok) {
			response.sendRedirect("../view/mensajeOk.jsp");
		}else {
			response.sendRedirect("../view/mensajeError.jsp");
		}

	}catch(Exception e){
		response.sendRedirect("../view/mensajeError.jsp");			
		e.printStackTrace();
	}

	%>


</body>
</html>