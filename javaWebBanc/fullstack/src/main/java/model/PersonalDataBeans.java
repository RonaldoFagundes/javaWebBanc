package model;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

// TODO: Auto-generated Javadoc
/**
 * The Class PersonalDataBeans.
 */
public class PersonalDataBeans {

	/** The id use. */
	private int idUse;
	
	/** The name. */
	private String name = "";
	
	/** The email. */
	private String email = "";
	
	/** The user. */
	private String user = "";
	
	/** The password. */
	private String password = "";

	/**
	 * Instantiates a new personal data beans.
	 */
	public PersonalDataBeans() {
		super();
	}

	/**
	 * Sets the id user.
	 *
	 * @param idUserP the new id user
	 */
	public void setIdUser(int idUserP) {
		this.idUse = idUserP;
	}

	/**
	 * Gets the id user.
	 *
	 * @return the id user
	 */
	public int getIdUser() {
		return this.idUse;
	}

	/**
	 * Sets the name.
	 *
	 * @param nameP the new name
	 */
	public void setName(String nameP) {
		this.name = nameP;
	}

	/**
	 * Gets the name.
	 *
	 * @return the name
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * Sets the user.
	 *
	 * @param userP the new user
	 */
	public void setUser(String userP) {
		this.user = userP;
	}

	/**
	 * Gets the user.
	 *
	 * @return the user
	 */
	public String getUser() {
		return this.user;
	}

	/**
	 * Sets the email.
	 *
	 * @param emailP the new email
	 */
	public void setEmail(String emailP) {
		this.email = emailP;
	}

	/**
	 * Gets the email.
	 *
	 * @return the email
	 */
	public String getEmail() {
		return this.email;
	}

	/**
	 * Sets the password.
	 *
	 * @param passwordP the new password
	 * @throws NoSuchAlgorithmException 
	 * @throws UnsupportedEncodingException 
	 */
	
	
	
	
	public void setPassword(String passwordP) {		  
		 this.password = passwordP;
		 System.out.println(password); 
	}
 
	
	
	
	public String getPassword() throws NoSuchAlgorithmException, UnsupportedEncodingException {
		
		MessageDigest md = MessageDigest.getInstance("MD5");
		 md.update(password.getBytes());
		 BigInteger hash = new BigInteger(1, md.digest());
		 return hash.toString(16);
	}
	
	
	
	
	
	
	
	

}
