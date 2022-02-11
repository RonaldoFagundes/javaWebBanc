package model;



import java.security.NoSuchAlgorithmException;

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
	public String logar(PersonalDataBeans dataBeans) {

		sql = "select id, nome from view_logar  where usuario = ? and senha = ?";
		try {
			connect();
			pst = conn.prepareStatement(sql);
			pst.setString(1, dataBeans.getUser());
			pst.setString(2, dataBeans.getPassword());
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
	 * @throws NoSuchAlgorithmException 
	 */
	
	public String cadastrarUser(PersonalDataBeans dataBeans)  {
    	 
		 sql = "select id from view_logar where email=?";
		 
		 try {
		  connect();
			pst = conn.prepareStatement(sql);
			pst.setString(1, dataBeans.getEmail());	 
			rs = pst.executeQuery();			
			if (rs.next()) {				
				 rsp = " email já cadastrado! ";			 
				 conn.close();			   
			}
			else {				
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
					   } catch (Exception e) {
					   System.out.println(" erro ao cadastrar " + e);
			      	}			
			     }
		       } catch (Exception e) {			
		           	System.out.println(" erro ao verificar email " + e);
	 	    }
		 		            return rsp;	
	     }
        
        
      
	
	
}