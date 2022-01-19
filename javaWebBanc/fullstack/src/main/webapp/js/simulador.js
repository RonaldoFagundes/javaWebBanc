
var $plat = document.querySelector("#plat");
var $gold = document.querySelector("#gold");
var $plus = document.querySelector("#plus");
var $max = document.querySelector("#max");

var $input_selic = document.querySelector("#selic");
var $input_valor = document.querySelector("#valor");
var $output_total = document.querySelector("#total");

var modalSimula = document.getElementById("modal_simula_invest");

var invest;
var ir;


$plat.addEventListener("click", function() {

	invest = document.querySelector("#plat_6").textContent;

	invest = invest.replace("% do cdi", "");
	invest = invest.replace(",", ".");
	invest = parseFloat(invest);
	invest = invest / 100;

	ir = document.getElementById("m6").value;
	ir = parseFloat(ir);
	ir = ir / 100;
	modalSimula.classList.add('modal-open-simula');

	alert(invest + " aliguota " + ir);
});


$gold.addEventListener("click", function() {

	invest = document.querySelector("#gold_12").textContent;

	invest = invest.replace("% do cdi", "");
	invest = invest.replace(",", ".");
	invest = parseFloat(invest);
	invest = invest / 100;

	ir = document.getElementById("m12").value;
	ir = parseFloat(ir);
	ir = ir / 100;
	modalSimula.classList.add('modal-open-simula');

	alert(invest + " aliguota " + ir);
});


$plus.addEventListener("click", function() {

	invest = document.querySelector("#plus_12").textContent;

	invest = invest.replace("% do cdi", "");
	invest = invest.replace(",", ".");
	invest = parseFloat(invest);
	invest = invest / 100;

	ir = document.getElementById("m12").value;
	ir = parseFloat(ir);
	ir = ir / 100;
	modalSimula.classList.add('modal-open-simula');

	alert(invest + " aliguota " + ir);
});



$max.addEventListener("click", function() {

	invest = document.querySelector("#max_12").textContent;

	invest = invest.replace("% do cdi", "");
	invest = invest.replace(",", ".");
	invest = parseFloat(invest);
	invest = invest / 100;

	ir = document.getElementById("m36").value;
	ir = parseFloat(ir);
	ir = ir / 100;
	modalSimula.classList.add('modal-open-simula');

	alert(invest + " aliguota " + ir);
});


$input_valor.oninput = function() {

	var selic = $input_selic.value;
	selic = parseFloat(selic);
	selic = selic / 100;


	var valor = $input_valor.value;
	valor = valor.replace(",", ".");


	var total = valor * invest * selic;
	total = total / 12;

	var aliguota = total * ir;

	total = total - aliguota;

	total = "R$	" + total.toFixed(2)
	total = total.replace(".", ",");
	$output_total.value = total;
}




 simula_close_modal =()=> {

	$input_valor.value = "";
	$output_total.value = "";
	var modalSimula = document.getElementById("modal_simula_invest");
	modalSimula.classList.remove('modal-open-simula');
}



