<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1 , shrink-to-fit=no">
<title>Sobre nós</title>
<link rel="icon" href="img/icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
     integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
     crossorigin="anonymous">
 
<link rel="stylesheet" href="css/style.css">
</head>


<body onload="setUserType()">

  <%
   String  user = (String) request.getAttribute("user");  
   String  opencnt = (String) request.getAttribute("opencnt");
  %>
   
 <main class="main">
 
    <header class="header">  
          <div class="logo"></div>
          <h1>Web bussines banc</h1>
        <div class="sidenav">
         <h3 id="user_type"><%out.println(user);%></h3>
	        <button class="dropdown-btn">Menu
               <i class="fa fa-caret-down"></i>
            </button>              
            <div class="dropdown-container"> 
              <div class="btn-movi-hidden" id="btn_movi" >
               <a href="movi" >Movimentação</a>
              </div>
               <a href="simulador">Simulador</a>
               <a href="index.jsp">Sair</a>
            </div>  
        </div>
    </header>
 
    <div class="space"></div>
<section class="body-sbn">
      
 <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
 
        <ol class="carousel-indicators">
           <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
           <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
           <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
         
   <div class="carousel-inner">        
        <!-- 1ª parte do carrossel -->
       <div class="carousel-item active">              
          <div class="container-card">	               
            <div class="card">            
             <div class="imgBx" data-text="Quem somos:">	 
               <img src="img/who.png">
             </div>	              
             <div class="content">             
              <div>	   
               <h3>Quem somos :</h3>		
                <p>
                    Uma startap fundanda por um grupo de desenvolvedores com a missão de impactar e transformar!
                </p>	
                <p>
                   Acreditamos que com a tecnologia 
                </p>
                 <p>
                   e mentes brilhantes podemos transformar o mundo
                </p>                	 
              </div>			  
             </div>             
           </div>	             
          <div class="card">            
              <div class="imgBx" data-text="Nossa História: ">	 
               <img src="img/history.PNG">
              </div>                 
             <div class="content">             
              <div>
               <h3> Nossa História:</h3>
                <p>
                  um casal diante das necessidades de se adaptar ao
                </p>
                 <p>
                  uso de aplicativos e sites começa a estudar tecnologia e  
                </p>
                 <p>
                   pesquisar as dificuldades das pessoas a acessar
                </p>
                <p>
                   determinados tipos de serviços
                </p>
                <p>
                   surgi então a web bussines banc 
                </p>              
              </div>              
             </div>              
         </div>              
       </div>           
    </div>	           
           
     <!-- 2ª parte do carrossel -->
    <div class="carousel-item">	              
       <div class="container-card">	            
         <div class="card">            
              <div class="imgBx" data-text="Social:">	 
               <img src="img/social.jpg">
              </div>              
             <div class="content">             
              <div>
               <h3>Social:</h3>
                 <p>
                  Ter a conciência das necessidades da sociedade que você faz parte, 
                  cobrar dos poderes publicos e concientizar os direitos e deveres de cada cidadão   
                </p>                
              </div>              
             </div>              
          </div>	            
          <div class="card">            
              <div class="imgBx" data-text="Parceiros:">	 
               <img src="img/work.png">
              </div>              
             <div class="content">             
              <div>
               <h3>Você</h3>
                <p>
                  que acredita em nós                                 
                </p>
                 <p>
                  para tornar a sua                                 
                </p>
                 <p>
                  vida simples                               
                </p>                
              </div>              
             </div>              
          </div>  
       </div>              
    </div>
          <!-- 3ª parte do carrossel -->
   <div class="carousel-item">            
     <div class="container-card">             
         <div class="card">            
              <div class="imgBx" data-text="Serviços:">	 
               <img src="img/foward.jpg">
              </div>              
             <div class="content">             
              <div>
               <h3>Facil para realizar:</h3>               
                <p>
                 &rarr; Pagamentos
               </p>
                 <p>
                 &rarr; Transferências
               </p>
                <p>
                 &rarr; Pix's
               </p>
                <p>
                 &rarr; Depositos
               </p>               
              </div>              
             </div>              
          </div>             
         <div class="card">            
              <div class="imgBx" data-text="Fundadores:">	 
               <img src="img/view.jpg">
              </div>              
             <div class="content">             
              <div>
               <h3>Missão</h3>               
                 <p>Grupo de desenvolvedores</p>
                 <p>Buscando impactar a sociedade  </p> 
                 <p>Trazendo solução simples para algo complicado </p>                
              </div>              
             </div>              
          </div>                   
       </div>            
     </div>          
   </div>       
         <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
           <span class="carousel-control-prev-icon" aria-hidden="true"></span>
           <span class="sr-only">Previous</span>
         </a>         
         <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
           <span class="carousel-control-next-icon" aria-hidden="true"></span>
           <span class="sr-only">Next</span>
         </a>         
 </div>
       
       <div class="open-count">
         <form name="form_openCnt" action="abrirConta">
          <button class="btn-open-count" id="cnt_new" onclick="openCnt()"><%out.println(opencnt);%></button>    
        </form>             
       </div>
       
</section>

</main>

<footer class="footer-sbn">
	
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

 <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 

   <script src="js/default.js"></script>
 
</body>
</html>