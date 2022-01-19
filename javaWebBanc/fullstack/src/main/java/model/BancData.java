package model;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Locale;

// TODO: Auto-generated Javadoc
/**
 * The Class BancData.
 */
public class BancData extends Dao {

	/** The list conta. */
	private ArrayList<String> listConta = new ArrayList<>();

	/** The doc valor. */
	private BigDecimal saldo, docValor;

	/** The currency BRL. */
	private NumberFormat currencyBRL = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));

	/** The id conta. */
	private int idConta;

	/** The doc trans. */
	private String openCnt, docData, docTipo, docCod, docTrans;

	/**
	 * Gets the conta numero.
	 *
	 * @param bancdata the bancdata
	 * @return the conta numero
	 */
	public ArrayList<String> getContaNumero(BancDataBeans bancdata) {

		sql = "select conta_numero from view_contas where id_usuario =?";

		try {
			connect();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, bancdata.getUser());
			rs = pst.executeQuery();

			while (rs.next()) {
				listConta.add(rs.getString(1));
			}
			conn.close();
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return listConta;
	}

	/**
	 * Gets the id conta.
	 *
	 * @param bancdata the bancdata
	 * @return the id conta
	 */
	public int getIdConta(BancDataBeans bancdata) {
		sql = "select id from view_id_conta where numero_cnt= ?";

		try {
			connect();
			pst = conn.prepareStatement(sql);
			pst.setString(1, bancdata.getConta());
			rs = pst.executeQuery();
			if (rs.next()) {
				idConta = rs.getInt(1);
			}
			conn.close();
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return idConta;
	}

	/**
	 * Gets the saldo.
	 *
	 * @param bancdata the bancdata
	 * @return the saldo
	 */
	public BigDecimal getSaldo(BancDataBeans bancdata) {

		sql = "select valor from view_saldo where numero_cnt = ?";
		try {
			connect();

			pst = conn.prepareStatement(sql);
			pst.setString(1, bancdata.getConta());
			rs = pst.executeQuery();
			if (rs.next()) {
				saldo = rs.getBigDecimal(1);
			}
			conn.close();
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return saldo;
	}

	/**
	 * Lancar movimentacao.
	 *
	 * @param bancdata the bancdata
	 * @return the string
	 */
	public String lancarMovimentacao(BancDataBeans bancdata) {

		sql = "call pro_lancar_movi(?,?,?,?,?);";
		try {
			connect();
			pst = conn.prepareStatement(sql);
			pst.setObject(1, bancdata.getToday());
			pst.setString(2, bancdata.getTipo());
			pst.setString(3, bancdata.getCod());
			pst.setBigDecimal(4, bancdata.getValor());
			pst.setInt(5, bancdata.getIdConta());
			pst.executeUpdate();
			conn.close();
			rsp = " lançado com sucesso !";
			System.out.println(rsp);
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return rsp;
	}

	/**
	 * Gets the doc movimentacao.
	 *
	 * @return the doc movimentacao
	 */
	public String getDocMovimentacao() {

		sql = "select * from view_movimentacao order by id_mov desc limit 1 ;";
		try {
			connect();
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			if (rs.next()) {
				docData = rs.getString(3);
				docTipo = rs.getString(4);
				docCod = rs.getString(5);
				docValor = rs.getBigDecimal(6);
			}
			conn.close();
		} catch (Exception ex) {
			System.out.println(ex);
		}
		docTrans = " " + docData + " " + docTipo + " " + docCod + " " + currencyBRL.format(docValor);
		return docTrans;
	}

	/**
	 * Gets the doc data.
	 *
	 * @return the doc data
	 */
	public String getDocData() {
		return docData;
	}

	/**
	 * Gets the doc tipo.
	 *
	 * @return the doc tipo
	 */
	public String getDocTipo() {
		return docTipo;
	}

	/**
	 * Gets the doc cod.
	 *
	 * @return the doc cod
	 */
	public String getDocCod() {
		return docCod;
	}

	/**
	 * Gets the doc valor.
	 *
	 * @return the doc valor
	 */
	public BigDecimal getDocValor() {
		return docValor;
	}

	/**
	 * Gets the extrato.
	 *
	 * @param bancdata the bancdata
	 * @return the extrato
	 */
	public ArrayList<BancDataBeans> getExtrato(BancDataBeans bancdata) {

		ArrayList<BancDataBeans> dados = new ArrayList<>();

		sql = "select * from view_movimentacao where numero_cnt = ?";
		try {
			connect();
			pst = conn.prepareStatement(sql);
			pst.setString(1, bancdata.getConta());

			rs = pst.executeQuery();

			while (rs.next()) {

				String data = rs.getString(3);
				String tipo = rs.getString(4);
				String cod = rs.getString(5);
				BigDecimal valor = rs.getBigDecimal(6);
				dados.add(new BancDataBeans(data, tipo, cod, valor));

			}
			conn.close();
			return dados;

		} catch (Exception ex) {
			System.out.println(ex);
			return null;
		}

	}

	/**
	 * Abrir conta.
	 *
	 * @param bancdata the bancdata
	 * @return the string
	 */
	public String abrirConta(BancDataBeans bancdata) {

		sql = "call pro_cad_conta (?,?,?);";
		try {
			connect();
			pst = conn.prepareStatement(sql);
			pst.setString(1, bancdata.getConta());
			pst.setString(2, bancdata.getTipo());
			pst.setInt(3, bancdata.getUser());
			pst.executeUpdate();
			conn.close();
			openCnt = "Conta nº " + bancdata.getConta() + " aberta com sucesso! ";
			System.out.println(" BancData conta nº " + bancdata.getConta() + " conta tipo " + bancdata.getTipo()
					+ " usuário " + bancdata.getUser());
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return openCnt;
	}

}
