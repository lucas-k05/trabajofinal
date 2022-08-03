package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dataBase.ConexionDB;
import model.Localidad;
import model.Pedido;

public class PedidoDAOC {
	
	
	public List<Pedido> listarPedidos() throws SQLException {
		ConexionDB conDB = new ConexionDB();
		Connection con= conDB.establecerConexion();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM pedidos");
		//SELECT pedidos.idpedido, pedidos.nombre, pedidos.apellido, localidades.idlocalidad, localidades.nombre FROM pedidos INNER JOIN localidades ON pedidos.localidad = localidades.idlocalidad
		
		List<Pedido> listPed = new ArrayList<Pedido>();
		while (rs.next()) {
			// un orm como hibernate lo hace automático
			LocalidadDAOC localidadDAOC = new LocalidadDAOC();
			Localidad localidad = localidadDAOC.getLocalidadXID(rs.getInt("localidad"));
			
			
			Pedido pedido = new Pedido(rs.getInt("idpedido"), rs.getString("nombre"), rs.getString("apellido"), rs.getString("usuario"), rs.getString("mail"), rs.getString("lugarentrega"), localidad, rs.getString("codpostal"), rs.getString("formadepago"),rs.getString("tarjtitular"),rs.getInt("tarjnumero"),rs.getString("tarjvto"),rs.getInt("tarjclave"));
			
			listPed.add(pedido);
		}
		
		return listPed;
		

	}
	
	public Pedido getPedidoXID(Integer id) throws SQLException {
		ConexionDB conDB = new ConexionDB();
		Connection con= conDB.establecerConexion();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM pedidos WHERE idpedido = " + id);
		//SELECT pedidos.idpedido, pedidos.nombre, pedidos.apellido, localidades.idlocalidad, localidades.nombre FROM pedidos INNER JOIN localidades ON pedidos.localidad = localidades.idlocalidad
		

		while (rs.next()) {
			// un orm como hibernate lo hace automático
			LocalidadDAOC localidadDAOC = new LocalidadDAOC();
			Localidad localidad = localidadDAOC.getLocalidadXID(rs.getInt("localidad"));
			
			
			Pedido pedido = new Pedido(rs.getInt("idpedido"), rs.getString("nombre"), rs.getString("apellido"), rs.getString("usuario"), rs.getString("mail"), rs.getString("lugarentrega"), localidad, rs.getString("codpostal"), rs.getString("formadepago"),rs.getString("tarjtitular"),rs.getInt("tarjnumero"),rs.getString("tarjvto"),rs.getInt("tarjclave"));
			
			return pedido;
		}
			
		return null;

	}
	
	public Boolean altaPedido(Pedido pedido) throws SQLException {
		ConexionDB conDB = new ConexionDB();
		Connection con= conDB.establecerConexion();
		Statement st = con.createStatement();

		String sql = new String();
		sql = "INSERT INTO pedidos "
				+ "(`nombre`, `apellido`, `usuario`, `mail`, `lugarentrega`, `localidad`, `codpostal`, `formadepago`, `tarjtitular`, `tarjnumero`, `tarjvto`, `tarjclave`) "
				+ "VALUES ("
				+ "'"+ pedido.getNombre() + "'," 
				+ "'" + pedido.getApellido() + "',"
				+ "'" + pedido.getUsuario() + "',"
				+ "'" + pedido.getMail() + "',"
				+ "'" + pedido.getLugarEntrega() + "',"				
				+ pedido.getLocalidad().getIdLocalidad() + "," 
				+ "'" + pedido.getCodPostal() + "',"
				+ "'" + pedido.getFormaDePago() + "',"
				+ "'" + pedido.getTarjTitular() + "',"				
				+ pedido.getTarjNumero() + "," 
				+ "'" + pedido.getTarjVto() + "',"
				+ pedido.getTarjClave() + ")";
		
		Integer insertOk = st.executeUpdate(sql);
		
		return insertOk >=1;
	}
	
	public Boolean udpPedido(Pedido pedido) throws SQLException {
		ConexionDB conDB = new ConexionDB();
		Connection con= conDB.establecerConexion();
		Statement st = con.createStatement();

		String sql = new String();
		sql = "UPDATE pedidos SET "
		+ "nombre= " + pedido.getNombre() + ","
		+ "apellido= " + pedido.getApellido() +  ""
		+ "Where idPedido=" + pedido.getIdPedido();
		System.out.println(sql);
		
		Integer insertOk = st.executeUpdate(sql);
		
		return insertOk >=1;
	}
		
}
