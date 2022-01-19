<%@page import="java.util.ArrayList"%>


<%@ 
page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
 %>
 <% 
    @ SuppressWarnings("unchecked")
    ArrayList<String> list =  (ArrayList <String>) request.getAttribute("conta"); 
 %> 
    
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1 , shrink-to-fit=no">
<title>Movimentcao</title>
<link rel="icon" href="img/icon.png">
<link rel="stylesheet" href="css/style.css">   
</head>

<body>
   <%
   String  user = (String) request.getAttribute("user");  
   %>
 <main class="main">
   
       <header class="header">  
        <div class="logo"></div>
           <h1>Web bussines banc</h1>         
	    <div class="sidenav">           
             <h3 id="logado"><%out.println(user);%></h3>	      
           <button class="dropdown-btn">Menu
             <i class="fa fa-caret-down"></i>
           </button>              
         <div class="dropdown-container">
              <a href="simulador">Simulador</a>
              <a href="sobrenos">Sobre Nós</a>
              <a href="index.jsp">Sair</a>
         </div>       
        </div>      
       </header>

    <div class="space"></div>
     
 <section class="container-main-movi">          
         
     <div class="movi-intru">            
        <div class="movi-intru-conta">        
           <p>Conta</p>         
           <form name="form_conta" action="setsaldo">         
              <select name="contaN">           
                <optgroup label="conta nº  ">                  
                    <option>selecione</option>
                      <%for (int i=0; i< list.size(); i++) {%>
              		<option><%out.println(list.get(i));%></option>	
                       <%}%>
                </optgroup>  
              </select> 
               <input type="button"  value="ok" onclick="selecionarConta()">   
           </form>
               <h3><%out.println(request.getAttribute("cnt")); %></h3>
               <h3>Saldo</h3>
               <h3 id="saldo" ><%out.println(request.getAttribute("saldo"));%></h3>
                  
        </div>       
     </div>            
      <div class="movi-modal-tarnsacao" id="movi_modal_tarnsacao">               
          <div class="tarnsacao-info">            
            <form name="form_transacao" action="transacao">              
             <div class="transacao-type">
               <input type="text"  readonly id="tipo" required  name="tran_tipo">
             </div>
             <div class="transacao-qr">
               <img src="img/qrcode.PNG">
             </div>                
             <div class="transacao-dados">
               <input type="text" name="codigo" placeholder="codigo">
               <input type="text" name="valor"  placeholder="Valor">
                <input type="button"  value="lancar" onclick="lancar()">  
             </div>
             <div class="tarnsacao-pro">
                <h4>Programar</h4>
               <input type="date">               
             </div>                  
            </form>                
          </div>            
       </div>          
     <div class="movi-service">  
        <div class="trans">         
          <img src="img/webBanc.PNG">	
		  <button name="pagamento" onclick="pagar()">Pagamentos</button>         
        </div>		
		<div class="trans">         
	      <img src="img/webBanc.PNG">		
		  <button name="pix" onclick="pix()">Pix</button>		  
        </div>  
        <div class="trans">
           <img src="img/webBanc.PNG">		
		   <button name="transferencia" onclick="transferir()">Transferências</button>
		</div>
        <div class="trans">
	       <img src="img/webBanc.PNG">		
		   <button name="investimento" onclick="investir()">Investimentos</button>
	 	</div>  	
  	    <div class="trans">  	     
  	       <div class="extrato-img">
  	         <img src="img/webBanc.PNG">
  	       </div>	 	
		   <div>
		      <a href="extrato" target="_blank">Extrato</a>
		   </div>	   	  		  
	 	</div>		
	 </div>   
       <div class="trans-return" id="trans_return">       
         <h2><%out.println(request.getAttribute("return"));%></h2>           
       </div>          
 <div class="trans-return">
         <h2><%out.println(request.getAttribute("doc"));%></h2>             
     <div class="return-pdf">Gerar pdf  &nbsp; 
       <a href="docpdf" class="">
         <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-pdf" viewBox="0 0 16 16">
           <path d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z"/>
           <path d="M4.603 12.087a.81.81 0 0 1-.438-.42c-.195-.388-.13-.776.08-1.102.198-.307.526-.568.897-.787a7.68 7.68 0 0 1 1.482-.645 19.701 19.701 0 0 0 1.062-2.227 7.269 7.269 0 0 1-.43-1.295c-.086-.4-.119-.796-.046-1.136.075-.354.274-.672.65-.823.192-.077.4-.12.602-.077a.7.7 0 0 1 .477.365c.088.164.12.356.127.538.007.187-.012.395-.047.614-.084.51-.27 1.134-.52 1.794a10.954 10.954 0 0 0 .98 1.686 5.753 5.753 0 0 1 1.334.05c.364.065.734.195.96.465.12.144.193.32.2.518.007.192-.047.382-.138.563a1.04 1.04 0 0 1-.354.416.856.856 0 0 1-.51.138c-.331-.014-.654-.196-.933-.417a5.716 5.716 0 0 1-.911-.95 11.642 11.642 0 0 0-1.997.406 11.311 11.311 0 0 1-1.021 1.51c-.29.35-.608.655-.926.787a.793.793 0 0 1-.58.029zm1.379-1.901c-.166.076-.32.156-.459.238-.328.194-.541.383-.647.547-.094.145-.096.25-.04.361.01.022.02.036.026.044a.27.27 0 0 0 .035-.012c.137-.056.355-.235.635-.572a8.18 8.18 0 0 0 .45-.606zm1.64-1.33a12.647 12.647 0 0 1 1.01-.193 11.666 11.666 0 0 1-.51-.858 20.741 20.741 0 0 1-.5 1.05zm2.446.45c.15.162.296.3.435.41.24.19.407.253.498.256a.107.107 0 0 0 .07-.015.307.307 0 0 0 .094-.125.436.436 0 0 0 .059-.2.095.095 0 0 0-.026-.063c-.052-.062-.2-.152-.518-.209a3.881 3.881 0 0 0-.612-.053zM8.078 5.8a6.7 6.7 0 0 0 .2-.828c.031-.188.043-.343.038-.465a.613.613 0 0 0-.032-.198.517.517 0 0 0-.145.04c-.087.035-.158.106-.196.283-.04.192-.03.469.046.822.024.111.054.227.09.346z"/>
         </svg>
	   </a>         
    </div>
 </div>     
          
</section>
     
</main>
 
 <footer class="fotter-movi">
	
	<div class="fotter-contatos">
	   <ul>
	    <li id="conta_fale" onmouseover="showPhone('FaleConosco')" onmouseout="HiddenPhone('FaleConosco')" >Fale conosco       
         <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
          <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
         </svg>
	    </li>
	     <li id="conta_email" onmouseover="showPhone('Email')" onmouseout="HiddenPhone('Email')" >e-mail :  &nbsp; 
          <a href=""><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-envelope-open" viewBox="0 0 16 16">
            <path d="M8.47 1.318a1 1 0 0 0-.94 0l-6 3.2A1 1 0 0 0 1 5.4v.818l5.724 3.465L8 8.917l1.276.766L15 6.218V5.4a1 1 0 0 0-.53-.882l-6-3.2zM15 7.388l-4.754 2.877L15 13.117v-5.73zm-.035 6.874L8 10.083l-6.965 4.18A1 1 0 0 0 2 15h12a1 1 0 0 0 .965-.738zM1 13.117l4.754-2.852L1 7.387v5.73zM7.059.435a2 2 0 0 1 1.882 0l6 3.2A2 2 0 0 1 16 5.4V14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V5.4a2 2 0 0 1 1.059-1.765l6-3.2z"/>
          </svg> </a>
         </li>
	     <li id="conta_phone" onmouseover="showPhone('Telefone')" onmouseout="HiddenPhone('Telefone')" >Telefone:  &nbsp;  
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
            <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
          </svg>	      
	     </li>
	     <li id="conta_whatsapp" onmouseover="showPhone('Whatsapp')" onmouseout="HiddenPhone('Whatsapp')"  >Whatsapp:  &nbsp;   
	       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-whatsapp" viewBox="0 0 16 16">
            <path d="M13.601 2.326A7.854 7.854 0 0 0 7.994 0C3.627 0 .068 3.558.064 7.926c0 1.399.366 2.76 1.057 3.965L0 16l4.204-1.102a7.933 7.933 0 0 0 3.79.965h.004c4.368 0 7.926-3.558 7.93-7.93A7.898 7.898 0 0 0 13.6 2.326zM7.994 14.521a6.573 6.573 0 0 1-3.356-.92l-.24-.144-2.494.654.666-2.433-.156-.251a6.56 6.56 0 0 1-1.007-3.505c0-3.626 2.957-6.584 6.591-6.584a6.56 6.56 0 0 1 4.66 1.931 6.557 6.557 0 0 1 1.928 4.66c-.004 3.639-2.961 6.592-6.592 6.592zm3.615-4.934c-.197-.099-1.17-.578-1.353-.646-.182-.065-.315-.099-.445.099-.133.197-.513.646-.627.775-.114.133-.232.148-.43.05-.197-.1-.836-.308-1.592-.985-.59-.525-.985-1.175-1.103-1.372-.114-.198-.011-.304.088-.403.087-.088.197-.232.296-.346.1-.114.133-.198.198-.33.065-.134.034-.248-.015-.347-.05-.099-.445-1.076-.612-1.47-.16-.389-.323-.335-.445-.34-.114-.007-.247-.007-.38-.007a.729.729 0 0 0-.529.247c-.182.198-.691.677-.691 1.654 0 .977.71 1.916.81 2.049.098.133 1.394 2.132 3.383 2.992.47.205.84.326 1.129.418.475.152.904.129 1.246.08.38-.058 1.171-.48 1.338-.943.164-.464.164-.86.114-.943-.049-.084-.182-.133-.38-.232z"/>
          </svg>
	     </li>   
	  </ul> 
      <div class="ref-dev">
	    <span>Developer &commat;RFagundes &nbsp; &nbsp; 
         <a href="https://www.linkedin.com/in/ronaldofagundes" target="_blank">
		  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-linkedin" viewBox="0 0 16 16">
           <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
          </svg>		  
		 </a>   
        </span>       
      </div>	  	  
	</div>   
</footer>
 
<script src="js/default.js"></script>
<script src="js/movimentacao.js"></script>

</body>
</html>