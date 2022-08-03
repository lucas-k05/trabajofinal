<!doctype html>
<%@page import="model.Pedido"%>
<%@page import="dao.PedidoDAOC"%>
<%@page import="model.Provincia"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProvinciaDAOC"%>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Modificar Pedido</title>

  <!-- Bootstrap core CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  
  <link href="css/estilo.css" rel="stylesheet" type="text/css">
  
</head>

<body class="bg-light">
    <header>
        <nav>
            <div id="header">
                <ul class="nav">
                    <li><a href="inicio.html">Inicio</a></li>
                    <li><a href="">Usuarios</a>
                        <ul>
                            <li><a href="altaUsuario.html">Crear Usuario</a></li>
                            <li><a href="listadoUsuarios.jsp">Listado de Usuarios</a></li>
                        </ul>
                    </li>
                    <li><a href="">Pedidos</a>
                        <ul>
                            <li><a href="listadoPedidosC.jsp">Listado de Pedidos</a></li>
                            <li><a href="pedidoC.jsp">Cargar Pedido</a></li>
                        </ul>
                    </li>
                    <li><a href="">Acerca de</a>
                        <ul>
                            <li><a href="">Nosotros</a></li>
                            <li><a href="">Nuestra Misión</a></li>
                            <li><a href="http://www.facebook.com">Historia</a></li>
                        </ul>
                    </li>
                    <li><a href="">Contacto</a></li>
                </ul>
            </div>
        </nav>
    </header>
    
	<div class="container">    
  <div class="py-4 text-center">
    <img class="d-block mx-auto mb-4" src="./images/logo.jpg" alt="Logo caba" width="72" height="72">
    <h2>Formulario de Pedido</h2>
    <p class="lead">La fecha de entrega será coordinada telefónicamente.</p>
  </div>

<% 
	String id = request.getParameter("id");
	PedidoDAOC dao = new PedidoDAOC();
	Pedido pedido = dao.getPedidoXID(Integer.valueOf(id));
%>

  <div class="col-md-12 text-center">
    <form  action="../controller/modificarPedidoC.jsp"  method="POST">
    	<input type="hidden" id="id" name="id" value="<%out.println(pedido.getIdPedido());%>" >	
    
      <div class="row">
        <div class="col-md-6 mb-3">
          <label for="firstName">Nombre</label>
          <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Tu nombre" value="<% out.println(pedido.getNombre()); %>" required >
          <div class="invalid-feedback">
            Debe ingresar su nombre.
          </div>
        </div>
        <div class="col-md-6 mb-3">
          <label for="lastName">Apellido</label>
          <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Tu apellido" value="<% out.println(pedido.getApellido()); %>" required>
          <div class="invalid-feedback">
            Faltó ingresar el apellido.
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-12 mb-3">
	        <label for="username">Nombre de Usuario</label>
	        <div class="input-group">
	          <div class="input-group-prepend">
	            <span class="input-group-text">@</span>
	          </div>
	          <input type="text" class="form-control" id="username" name="username" placeholder="Usuario" required value="<% out.println(pedido.getUsuario()); %>">
	          <div class="invalid-feedback" style="width: 100%;">
	            Faltó ingresar el usuario.
	          </div>
	        </div>
	      </div>
	   </div>

      <div class="row">
        <div class="col-md-12 mb-3">
	        <label for="email">Email <span class="text-muted">(Optional)</span></label>
	        <input type="email" class="form-control" id="email"  name="email" placeholder="tumail@gmail.com" value="<% out.println(pedido.getMail()); %>">
	        <div class="invalid-feedback">
	          El e-mail es inválido.
	        </div>
	      </div>
	   </div>	  

      <div class="row">
        <div class="col-md-12 mb-3">
	        <label for="address">Lugar de Entrega</label>
	        <input type="text" class="form-control" id="address" name="address" placeholder="Calle, nro,  localidad..." value="<% out.println(pedido.getLugarEntrega()); %>" required>
	        <div class="invalid-feedback">
	          Faltó ingresar el domicilio de entrega.
	        </div>
	      </div>
	   </div>



      <div class="row">
        <div class="col-md-5 mb-3">
          <label for="country">Localidad</label>
          <select class="custom-select d-block w-100" id="country" name="country" required>
            <option value="">Seleccioná.</option>
            <option value="1">Moreno</option>
          </select>
          <div class="invalid-feedback">
            Seleccioná una localidad válida.
          </div>
        </div>
        <div class="col-md-4 mb-3">
          <label for="state">Provincia</label>
  
          <select class="custom-select d-block w-100" id="state" name="state" required>
            <option value="">Seleccioná.</option>
            <option value="1">Buenos Aires</option>
            <option value="2">Tucumán</option>
          </select>
          <div class="invalid-feedback">
            Seleccioná una provincia válida.
          </div>
        </div>
        <div class="col-md-3 mb-3">
          <label for="zip">Cod.Postal</label>
          <input type="text" class="form-control" id="zip" name="zip" placeholder="" value="<% out.println(pedido.getCodPostal()); %>" required>
          <div class="invalid-feedback">
            Faltó ingresar el Código Postal.
          </div>
        </div>
      </div>


      <hr class="mb-6">

      <h4 class="mb-3">Forma de Pago</h4>

      <div class="d-block my-3">
        <div class="custom-control custom-radio">
          <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
          <label class="custom-control-label" for="credit">Tarjeta de Crédito</label>
        </div>
        <div class="custom-control custom-radio">
          <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
          <label class="custom-control-label" for="debit">Mercado Pago</label>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 mb-3">
          <label for="cc-name">Nombre del Titular de la Tarjeta</label>
          <input type="text" class="form-control" id="cc-name" name="cc-name" placeholder="" value="<% out.println(pedido.getTarjTitular()); %>" required>
          <small class="text-muted">Nombre como se muestra en la tarjeta</small>
          <div class="invalid-feedback">
            El nombre debe ser ingresado.
          </div>
        </div>
        <div class="col-md-6 mb-3">
          <label for="cc-number">Número de la tarjeta</label>
          <input type="text" class="form-control" id="cc-number" name="cc-number" placeholder="" value="<% out.println(pedido.getTarjNumero()); %>" required>
          <div class="invalid-feedback">
            El número es obligatorio.
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-3 mb-3"></div>
        <div class="col-md-3 mb-3">
          <label for="cc-expiration">Fecha de Vto.</label>
          <input type="text" class="form-control" id="cc-expiration" name="cc-expiration" placeholder="" value="<% out.println(pedido.getTarjVto()); %>" required>
          <div class="invalid-feedback">
            Falta ingresar la fecha de Vto.
          </div>
        </div>
        <div class="col-md-3 mb-3">
          <label for="cc-cvv">Código</label>
          <input type="text" class="form-control" id="cc-cvv" name="cc-cvv" placeholder="" value="<% out.println(pedido.getTarjClave()); %>" required>
          <div class="invalid-feedback">
            Nro de seguridad obligatorio.
          </div>
        </div>
      </div>
      <hr class="mb-4">
      <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
          <button class="btn btn-primary btn-lg btn-block" type="submit">Modificar Solicitud</button>
        </div>
      </div>
    </form>
  </div>
  </div>
</div>
  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017-2020 Codo a Codo</p>
  </footer>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

</html>