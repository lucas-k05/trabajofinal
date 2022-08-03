package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dataBase.ConexionDB;
import model.Provincia;


public class ProvinciaDAOC {

	public List<Provincia> listarProvincias() throws SQLException {
		ConexionDB conexionDB = new ConexionDB();
		Connection conn= conexionDB.establecerConexion();
		Statement st= conn.createStatement();

		ResultSet rs = st.executeQuery("SELECT * FROM provincias");
		
		List<Provincia> listUsu = new ArrayList<Provincia>();
		while (rs.next()) {
			//TODO: populate provincia con rs
			
		}
		
		
		return listUsu;		

	}
	
	public Provincia getProvinciaXID(Integer id) throws SQLException {
		//TODO: poner conn en static para que haya una sola instancia en todo el proyecto
		ConexionDB conDB = new ConexionDB();
		Connection con= conDB.establecerConexion();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM provincias WHERE idprovincia = " + id);	
		
		while (rs.next()) {
			
			Provincia provincia = new Provincia(rs.getInt("idprovincia"), rs.getString("nombre"));
			
			return provincia;
		}

		return null;
	}
	
	

}
