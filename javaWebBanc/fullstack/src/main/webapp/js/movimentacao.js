

selecionarConta = () => {

	let conta = form_conta.contaN.value;

	alert(" conta nº  " + conta);

	document.forms['form_conta'].submit();
}




let transacao = document.getElementById('transacao');

let modal_trans = document.getElementById('movi_modal_tarnsacao');


pagar = () => {
	modal_trans.classList.add('movi-modal-tarnsacao-show');
	document.querySelector("[name='tran_tipo']").value = "Pagamento";
}

pix = () => {
	modal_trans.classList.add('movi-modal-tarnsacao-show');
	document.querySelector("[name='tran_tipo']").value = "Pix";
}

transferir = () => {
	modal_trans.classList.add('movi-modal-tarnsacao-show');
	document.querySelector("[name='tran_tipo']").value = "Transferência";
}

investir = () => {
	modal_trans.classList.add('movi-modal-tarnsacao-show');
	document.querySelector("[name='tran_tipo']").value = "Investimentos";

}


lancar = () => {

	let valor = form_transacao.valor.value;
	valor = valor.replace(",", ".");
	valor = parseFloat(valor);

	let saldo = document.getElementById("saldo").textContent;
	saldo = saldo.replace("R$", "");
	saldo = saldo.replace(",", ".");
	saldo = parseFloat(saldo);


	let tipo = document.getElementById("tipo").value;

	if (tipo === "Transferência") {
		alert(tipo + " no valor de " + valor + " lançado com sucesso! ");

		document.forms['form_transacao'].submit();

		modal_trans.classList.remove('movi-modal-tarnsacao-show');

	}
	else {

		if (saldo >= valor) {
			alert(tipo + " no valor de " + valor + " lançado com sucesso! ");

			document.forms['form_transacao'].submit();

			modal_trans.classList.remove('movi-modal-tarnsacao-show');

		}
		else {
			alert(" saldo  " + saldo + " valor " + valor + " não possivel ");

			return false;
		}
	}

}
