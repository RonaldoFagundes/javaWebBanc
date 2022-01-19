package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// TODO: Auto-generated Javadoc
/**
 * The Class Dao.
 */
public class Dao {

	/** The conn. */
	public Connection conn = null;
	
	/** The pst. */
	public PreparedStatement pst = null;
	
	/** The rs. */
	public ResultSet rs = null;
	
	/** The rsp. */
	public String sql, rsp;

	/** The driver. */
	private String driver = "com.mysql.cj.jdbc.Driver";
	
	/** The locahost. */
	private String locahost = "//127.0.0.1:3306/";
	
	/** The database. */
	private String database = "db_web_bussines_banc";

	/** The url. */
	private String url = "jdbc:mysql:" + locahost + database + "?useTimezone=true&serverTimezone=UTC";

	/** The user. */
	private String user = "RFagundes";

	/** The password. */
	private String password = "UREgoOymPF6LWa7H";

	/**
	 * Connect.
	 *
	 * @return the connection
	 */
	public Connection connect() {

		try {

			Class.forName(driver);

			conn = DriverManager.getConnection(url, user, password);

			return conn;

		} catch (Exception ex) {

			return null;
		}

	}

	/**
	 * The main method.
	 *
	 * @param args the arguments
	 */
	public static void main(String[] args) {

		Dao dao = new Dao();

		dao.connect();
	}

}
