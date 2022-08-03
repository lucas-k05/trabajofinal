package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dataBase.ConexionDB;
import model.Usuario;

public class UsuarioDAOC {
	
	//TODO: poner java doc
	public Boolean validarUsuYPass(String usu, String pass) throws SQLException {
		//conn db
		ConexionDB conexionDB = new ConexionDB();
		Connection conn= conexionDB.establecerConexion();
		Statement st= conn.createStatement();
		
		//consulta si existe el usu y pass ingresado en login
		ResultSet rs = st.executeQuery("SELECT * FROM usuarios WHERE usuario='"+ usu +"' and clave='"+ pass + "'");
		
//		if (rs.next()) {
//			return true;
//		} else {
//			return false;
//		}
		
		return rs.next();
	}
	
	/**
	 * Guarda un usuario en la tabla <code>Usuarios</code>
	 * 
	 * @param usu string con un email válido
	 * @param pass string con la pass con fortaleza, debe tener mayu, min, y núm
	 * @return true si guardo ok, false si no guardo
	 * @throws SQLException
	 */
	public Boolean guardarUsuario(String usu, String pass) throws SQLException {
		ConexionDB conexionDB = new ConexionDB();
		Connection conn= conexionDB.establecerConexion();
		Statement st= conn.createStatement();
		
				
		//consulta si existe el usu y pass ingresado en login
		String sql = new String("INSERT INTO usuarios (usuario, clave) VALUES ('" + usu + "','" + pass + "')");		
		Integer insertOk = st.executeUpdate(sql);
		
		return insertOk >= 1;
		

	}
	
	/**
	 * Obtiene todos los usuarios de la tabla <code>Usuarios</code>
	 * 
	 * @return una colección {@link List} con objetos {@linkplain Usuario} dentro 
	 * @throws SQLException
	 */
	public List<Usuario> listarUsuarios() throws SQLException {
		ConexionDB conexionDB = new ConexionDB();
		Connection conn= conexionDB.establecerConexion();
		Statement st= conn.createStatement();

		ResultSet rs = st.executeQuery("SELECT * FROM usuarios");
		
		List<Usuario> listUsu = new ArrayList<Usuario>();
		while (rs.next()) {
			Usuario usu = new Usuario(rs.getInt("idusuario"), rs.getString("usuario"), rs.getString("clave"));
			
			listUsu.add(usu);
		}
		
		
		return listUsu;
	}	
	

}
