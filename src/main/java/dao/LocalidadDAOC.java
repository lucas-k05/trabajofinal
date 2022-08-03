package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dataBase.ConexionDB;
import model.Localidad;
import model.Provincia;

public class LocalidadDAOC {

	public Localidad getLocalidadXID(Integer id) throws SQLException {
		//TODO: poner conn en static para que haya una sola instancia en todo el proyecto
		ConexionDB conDB = new ConexionDB();
		Connection con= conDB.establecerConexion();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM localidades WHERE idlocalidad = " + id);	
		
		while (rs.next()) {
			ProvinciaDAOC provinciaDAOC = new ProvinciaDAOC();
			Provincia provincia = provinciaDAOC.getProvinciaXID(rs.getInt("idProvincia"));
			
			Localidad localidad = new Localidad(rs.getInt("idLocalidad"), rs.getString("nombre"), provincia);
			
			return localidad;
		}

		return null;
	}
	
}
