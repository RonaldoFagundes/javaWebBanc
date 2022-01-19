package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BancData;
import model.BancDataBeans;
import model.PersonalData;
import model.PersonalDataBeans;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

// TODO: Auto-generated Javadoc
/**
 * The Class Controller.
 */
@WebServlet(urlPatterns = { "/Controller", "/logar", "/cadastrar", "/mov", "/setsaldo", "/transacao", "/docpdf",
		"/extrato", "/extpdf", "/simulador", "/investir", "/sobrenos", "/abrirConta" })
public class Controller extends HttpServlet {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** The pd. */
	PersonalData pd = new PersonalData();
	
	/** The pdb. */
	PersonalDataBeans pdb = new PersonalDataBeans();

	/** The bd. */
	BancData bd = new BancData();
	
	/** The bdb. */
	BancDataBeans bdb = new BancDataBeans();

	/** The user. */
	private String user = "";
	
	/** The cnt. */
	private String transacao, tipoTra, opencnt, cnt;
	
	/** The id cnt. */
	private int idUse, idCnt;
	
	/** The valor. */
	private BigDecimal saldo, valor;
	
	/** The currency BRL. */
	private NumberFormat currencyBRL = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));

	/** The today. */
	private LocalDate today = LocalDate.now();

	/** The formatter. */
	private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

	/** The contas. */
	ArrayList<String> contas = new ArrayList<>();

	/** The gerador. */
	private Random gerador = new Random();

	/**
	 * Instantiates a new controller.
	 */
	public Controller() {
		super();
	}

	/**
	 * Do get.
	 *
	 * @param request the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getServletPath();

		System.out.println(action);

		if (action.equals("/logar")) {
			logar(request, response);
		} else if (action.equals("/cadastrar")) {
			cadastrar(request, response);
		} else if (action.equals("/mov") || action.equals("/investir")) {
			movimentacao(request, response);
		} else if (action.equals("/setsaldo")) {
			setarSaldo(request, response);
		} else if (action.equals("/transacao")) {
			lancarTransacao(request, response);
		} else if (action.equals("/docpdf")) {
			docTransacao(request, response);
		} else if (action.equals("/extrato")) {
			exibirExtrato(request, response);
		} else if (action.equals("/extpdf")) {
			emitirExtrato(request, response);
		} else if (action.equals("/simulador")) {
			simulador(request, response);
		} else if (action.equals("/sobrenos")) {
			sobrenos(request, response);
		} else if (action.equals("/abrirConta")) {
			abrirConta(request, response);
		}
	}

	/**
	 * Logar.
	 *
	 * @param request the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	protected void logar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String useUser = request.getParameter("user");
		String password = request.getParameter("password");

		System.out.println(useUser + " " + password);

		pdb.setUser(useUser);
		pdb.setPassword(password);
		user = pd.logar(pdb);
		idUse = pd.getIdUser();

		bdb.setUser(idUse);

		contas = bd.getContaNumero(bdb);

		if (user == null) {
			System.out.println(" senha ou user incorretos! ");

			request.setAttribute("confirm", "senha ou user incorretos!");

			RequestDispatcher erro = request.getRequestDispatcher("index.jsp");
			erro.forward(request, response);
		} else {

			if (contas.isEmpty()) {

				System.out.println(user + " Bem vindo(a) click aqui para nos conhecer ");

				request.setAttribute("user", " Olá visitante, " + user);
				request.setAttribute("confirm", user + " Bem vindo(a) click aqui para nos conhecer ");

				RequestDispatcher conhecer = request.getRequestDispatcher("index.jsp");
				conhecer.forward(request, response);

			} else {

				System.out.println(user + " Bem vindo(a) click aqui para navegar ");

				request.setAttribute("user", " Olá cliente, " + user);
				request.setAttribute("confirm", user + " Bem vindo(a) click aqui para navegar ");

				RequestDispatcher navegar = request.getRequestDispatcher("index.jsp");
				navegar.forward(request, response);

			}
		}
	}

	/**
	 * Cadastrar.
	 *
	 * @param request the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	protected void cadastrar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		pdb.setName(request.getParameter("name").toString());
		pdb.setEmail(request.getParameter("email").toString());
		pdb.setUser(request.getParameter("user").toString());
		pdb.setPassword(request.getParameter("password").toString());

		request.setAttribute("confirm", pd.cadastrarUser(pdb) + " faça o login! ");

		RequestDispatcher cad = request.getRequestDispatcher("index.jsp");
		cad.forward(request, response);
	}

	/**
	 * Movimentacao.
	 *
	 * @param request the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	protected void movimentacao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("user", user);

		request.setAttribute("conta", contas);

		RequestDispatcher mov = request.getRequestDispatcher("movimentacao.jsp");
		mov.forward(request, response);

	}

	/**
	 * Setar saldo.
	 *
	 * @param request the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	protected void setarSaldo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		bdb.setConta(request.getParameter("contaN").trim());

		cnt = request.getParameter("contaN").trim();

		saldo = bd.getSaldo(bdb);

		request.setAttribute("user", user);

		request.setAttribute("conta", contas);

		request.setAttribute("cnt", " nº " + cnt);

		request.setAttribute("saldo", currencyBRL.format(saldo));

		RequestDispatcher sld = request.getRequestDispatcher("movimentacao.jsp");
		sld.forward(request, response);

	}

	/**
	 * Lancar transacao.
	 *
	 * @param request the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	protected void lancarTransacao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		idCnt = bd.getIdConta(bdb);

		transacao = request.getParameter("tran_tipo");

		valor = new BigDecimal(request.getParameter("valor").trim().replace(",", "."));

		if (transacao.contains("Pagamento") || transacao.contains("Pix")) {
			tipoTra = "Saida";
		} else {
			tipoTra = "Entrada";
		}

		bdb.setToday(today);
		bdb.setTipo(tipoTra);
		bdb.setCod(request.getParameter("codigo"));
		bdb.setValor(valor);
		bdb.setIdConta(idCnt);

		request.setAttribute("user", user);
		request.setAttribute("conta", contas);
		request.setAttribute("return", bd.lancarMovimentacao(bdb));

		request.setAttribute("doc", bd.getDocMovimentacao());

		RequestDispatcher tran = request.getRequestDispatcher("movimentacao.jsp");
		tran.forward(request, response);

	}

	/**
	 * Doc transacao.
	 *
	 * @param request the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	protected void docTransacao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Document doc = new Document();

		try {
			response.setContentType("apllication/pdf");
			response.addHeader("Content-Disposition", "inline; filename=" + "doc.pdf");
			PdfWriter.getInstance(doc, response.getOutputStream());
			doc.open();

			doc.add(new Paragraph(" Comprovante de transação: "));
			doc.add(new Paragraph(" "));

			PdfPTable tabela = new PdfPTable(4);
			PdfPCell col1 = new PdfPCell(new Paragraph("Data"));
			PdfPCell col2 = new PdfPCell(new Paragraph("Tipo"));
			PdfPCell col3 = new PdfPCell(new Paragraph("Cod"));
			PdfPCell col4 = new PdfPCell(new Paragraph("Valor"));

			tabela.addCell(col1);
			tabela.addCell(col2);
			tabela.addCell(col3);
			tabela.addCell(col4);

			tabela.addCell(bd.getDocData());
			tabela.addCell(bd.getDocTipo());
			tabela.addCell(bd.getDocCod());
			tabela.addCell(bd.getDocValor().toString());

			doc.add(tabela);
			doc.close();
		} catch (Exception ex) {
			System.out.println(ex);
			doc.close();
		}

	}

	/**
	 * Exibir extrato.
	 *
	 * @param request the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	protected void exibirExtrato(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<BancDataBeans> lista = bd.getExtrato(bdb);

		request.setAttribute("user", user);
		request.setAttribute("cnt", " conta nº " + cnt);
		request.setAttribute("dados", lista);

		RequestDispatcher ext = request.getRequestDispatcher("extrato.jsp");
		ext.forward(request, response);
	}

	/**
	 * Emitir extrato.
	 *
	 * @param request the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	protected void emitirExtrato(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Document doc = new Document();

		try {
			response.setContentType("apllication/pdf");
			response.addHeader("Content-Disposition", "inline; filename=" + "doc.pdf");
			PdfWriter.getInstance(doc, response.getOutputStream());
			doc.open();

			doc.add(new Paragraph(" Extrato Bancário: "));
			doc.add(new Paragraph(" "));

			PdfPTable tabela = new PdfPTable(4);
			PdfPCell col1 = new PdfPCell(new Paragraph("Data"));
			PdfPCell col2 = new PdfPCell(new Paragraph("Tipo"));
			PdfPCell col3 = new PdfPCell(new Paragraph("Cod"));
			PdfPCell col4 = new PdfPCell(new Paragraph("Valor"));

			tabela.addCell(col1);
			tabela.addCell(col2);
			tabela.addCell(col3);
			tabela.addCell(col4);

			ArrayList<BancDataBeans> lista = bd.getExtrato(bdb);

			for (int i = 0; i < lista.size(); i++) {
				tabela.addCell(lista.get(i).getHoje());
				tabela.addCell(lista.get(i).getTipo());
				tabela.addCell(lista.get(i).getCod());
				tabela.addCell(lista.get(i).getValor().toString());
			}

			doc.add(tabela);
			doc.close();
		} catch (Exception ex) {
			System.out.println(ex);
			doc.close();
		}

	}

	/**
	 * Simulador.
	 *
	 * @param request the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	protected void simulador(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (contas.isEmpty()) {
			request.setAttribute("user", " Visitante  " + user);
		} else {
			request.setAttribute("user", " Cliente  " + user);
		}

		request.setAttribute("today", " ultima atualização   " + today.format(formatter));

		RequestDispatcher simu = request.getRequestDispatcher("simulador.jsp");
		simu.forward(request, response);

	}

	/**
	 * Sobrenos.
	 *
	 * @param request the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	protected void sobrenos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (contas.isEmpty()) {
			request.setAttribute("user", " Visitante  " + user);
		} else {
			request.setAttribute("user", " Cliente  " + user);
		}

		opencnt = "Abra já a sua conta!";

		request.setAttribute("opencnt", opencnt);
		RequestDispatcher sn = request.getRequestDispatcher("sobrenos.jsp");
		sn.forward(request, response);

	}

	/**
	 * Abrir conta.
	 *
	 * @param request the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	protected void abrirConta(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int cntNewI = gerador.nextInt(9998);
		String cntNewS = String.valueOf(cntNewI);

		String tipoNew = "001";

		bdb.setConta(cntNewS);

		bdb.setTipo(tipoNew);

		bdb.setUser(idUse);

		request.setAttribute("user", user);
		request.setAttribute("opencnt", user + " " + bd.abrirConta(bdb) + " faça login novamente! ");
		RequestDispatcher sn = request.getRequestDispatcher("sobrenos.jsp");
		sn.forward(request, response);

	}

}
