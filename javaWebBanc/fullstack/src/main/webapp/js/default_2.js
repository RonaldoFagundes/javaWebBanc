
setUserType = () => {

	var userType = document.getElementById("user_type").innerText;

	var btnMov = document.getElementById("btn_movi");

	if (userType.startsWith("Cliente")) {
		alert(userType);
		btnMov.classList.add('btn-movi-show');
	}
	else if (userType.startsWith("Visitante")) {
		alert(userType + " Abra sua conta e facilite sua vida!");
	}

}






/* ref header dropdown */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
	dropdown[i].addEventListener("click", function() {
		this.classList.toggle("active");
		var dropdownContent = this.nextElementSibling;
		if (dropdownContent.style.display === "block") {
			dropdownContent.style.display = "none";
		} else {
			dropdownContent.style.display = "block";
		}
	});
}







/* ref modal login */
var btnSignin = document.querySelector("#signin");

var btnSignup = document.querySelector("#signup");

var body = document.querySelector("body");


var btnUser = document.querySelector("#btn_close_Modal");

var modal = document.querySelector("#modal_container");




btnSignin.addEventListener("click", function() {
	body.className = "sign-in-js";
});


btnSignup.addEventListener("click", function() {
	body.className = "sign-up-js";
});





btnUser.addEventListener("click", function() {

	var user = document.getElementById("btn_close_Modal").innerText;

	var btnMov = document.getElementById("btn_movi");



	if (user.endsWith("incorretos!") || user.endsWith("null") || user.endsWith("faça o login!")) {

		alert("  faça o login! ");
	}

	else if (user.endsWith("navegar")) {

		alert(user);
		modal.classList.add('close-modal');
		btnMov.classList.add('btn-movi-show');

	}

	else {
		alert(user);
		modal.classList.add('close-modal');
	}
});




validar = () => {

	let userName = form_cad.name.value;
	let userEmail = form_cad.email.value;
	let userUser = form_cad.user.value;
	let userPassword = form_cad.password.value;



	if (userName === "") {
		alert(" preecha o campo nome ");
		form_cad.name.focus();
		return false;
	}
	else if (userEmail === "") {
		alert(" preecha o campo email ");
		form_cad.email.focus();
		return false;
	}
	else if (userUser === "") {
		alert(" preecha o campo user ");
		form_cad.user.focus();
		return false;
	}
	else if (userPassword === "" || userPassword == !userPassword.indexOf(8)) {
		alert(" preecha o campo senha ");
		form_cad.password.focus();
		return false;
	}
	else {
		alert(" usuario " + userName + " cadastrado(a) com sucesso! faça login e seja Bem Vindo(a)!! ");
		document.forms['form_cad'].submit();
	}
}



openCnt = () => {

	var cntNew = document.getElementById("cnt_new").innerText;
	alert(cntNew);
	document.forms['form_openCnt'].submit();
}




