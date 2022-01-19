package model;

import java.math.BigDecimal;
import java.time.LocalDate;

// TODO: Auto-generated Javadoc
/**
 * The Class BancDataBeans.
 */
public class BancDataBeans {

	/** The user. */
	private int user;

	/** The tipo. */
	private String today, conta, cod, tipo;

	/** The id conta. */
	private int idConta;

	/** The valor. */
	private BigDecimal valor;

	/** The today L. */
	private LocalDate todayL;

	/**
	 * Instantiates a new banc data beans.
	 */
	public BancDataBeans() {
		super();
	}

	/**
	 * Instantiates a new banc data beans.
	 *
	 * @param todayP the today P
	 * @param tipoP the tipo P
	 * @param codP the cod P
	 * @param valorP the valor P
	 */
	public BancDataBeans(String todayP, String tipoP, String codP, BigDecimal valorP) {
		super();
		this.today = todayP;
		this.tipo = tipoP;
		this.cod = codP;
		this.valor = valorP;
	}

	/**
	 * Sets the user.
	 *
	 * @param userP the new user
	 */
	public void setUser(int userP) {
		this.user = userP;
	}

	/**
	 * Gets the user.
	 *
	 * @return the user
	 */
	public int getUser() {
		return this.user;
	}

	/**
	 * Sets the conta.
	 *
	 * @param contaP the new conta
	 */
	public void setConta(String contaP) {
		this.conta = contaP;
	}

	/**
	 * Gets the conta.
	 *
	 * @return the conta
	 */
	public String getConta() {
		return this.conta;
	}

	/**
	 * Gets the cod.
	 *
	 * @return the cod
	 */
	public String getCod() {
		return cod;
	}

	/**
	 * Sets the cod.
	 *
	 * @param cod the new cod
	 */
	public void setCod(String cod) {
		this.cod = cod;
	}

	/**
	 * Gets the tipo.
	 *
	 * @return the tipo
	 */
	public String getTipo() {
		return tipo;
	}

	/**
	 * Sets the tipo.
	 *
	 * @param tipo the new tipo
	 */
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	/**
	 * Gets the id conta.
	 *
	 * @return the id conta
	 */
	public int getIdConta() {
		return idConta;
	}

	/**
	 * Sets the id conta.
	 *
	 * @param idConta the new id conta
	 */
	public void setIdConta(int idConta) {
		this.idConta = idConta;
	}

	/**
	 * Gets the valor.
	 *
	 * @return the valor
	 */
	public BigDecimal getValor() {
		return valor;
	}

	/**
	 * Sets the valor.
	 *
	 * @param valor the new valor
	 */
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	/**
	 * Gets the hoje.
	 *
	 * @return the hoje
	 */
	public String getHoje() {
		return today;
	}

	/**
	 * Sets the hoje.
	 *
	 * @param todayP the new hoje
	 */
	public void setHoje(String todayP) {
		this.today = todayP;
	}

	/**
	 * Gets the today.
	 *
	 * @return the today
	 */
	public LocalDate getToday() {
		return todayL;
	}

	/**
	 * Sets the today.
	 *
	 * @param today the new today
	 */
	public void setToday(LocalDate today) {
		this.todayL = today;
	}

}
