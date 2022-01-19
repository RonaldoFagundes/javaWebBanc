package model;

// TODO: Auto-generated Javadoc
/**
 * The Class PersonalData.
 */
public class PersonalData extends Dao {

	/** The usuario. */
	private String usuario;

	/** The id use. */
	private int idUse;

	/**
	 * Logar.
	 *
	 * @param personaldata the personaldata
	 * @return the string
	 */
	public String logar(PersonalDataBeans personaldata) {

		sql = "select id, nome from view_logar  where usuario = ? and senha = ?";
		try {
			connect();
			pst = conn.prepareStatement(sql);
			pst.setString(1, personaldata.getUser());
			pst.setString(2, personaldata.getPassword());
			rs = pst.executeQuery();
			if (rs.next()) {
				idUse = rs.getInt(1);
				usuario = rs.getString(2);
			} else {
				usuario = null;
			}
			conn.close();
		} catch (Exception ex) {
			System.out.println(" error " + ex);
		}
		return usuario;
	}

	/**
	 * Gets the id user.
	 *
	 * @return the id user
	 */
	public int getIdUser() {
		return idUse;
	}

	/**
	 * Cadastrar user.
	 *
	 * @param dataBeans the data beans
	 * @return the string
	 */
	public String cadastrarUser(PersonalDataBeans dataBeans) {

		sql = "call pro_cad_user (?,?,?,?)";
		try {
			connect();
			pst = conn.prepareStatement(sql);

			pst.setString(1, dataBeans.getName());
			pst.setString(2, dataBeans.getEmail());
			pst.setString(3, dataBeans.getUser());
			pst.setString(4, dataBeans.getPassword());
			pst.executeUpdate();
			conn.close();
			rsp = " usuário " + dataBeans.getName() + " Cadastrado com sucesso! ";
			System.out.println(rsp);
		} catch (Exception ex) {
			System.out.println(" erro no metodo cadastrarUser " + ex);
		}
		return rsp;
	}

}
