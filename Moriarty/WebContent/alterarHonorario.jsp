<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alterar honor�rio</title>
<%@ include file = "includes.jsp" %>
</head>
<body>
<%@ include file = "menu.jsp" %>
<div class = "container">
 <h1>Alterar honor�rio</h1>
 
 <div class = "col-md-6">
  <form action = "buscaServlet" method = "post">
  <input type = "hidden" name = "acao" value = "alterarHonorario">
   <div class = "form-group">
    <label for = "idCodHon">C�digo Lan�amento</label>
    <input type = "text" name = "codigoLancamentoHonorario" id = "idCodHon" class = "form-control" value = "${chaveHonorarioAlterado.codigoLancamento}" readonly>
   </div>
   <div class = "form-group">
    <label for = "idCodTarefa">C�digo Tipo Tarefa</label>
    <input type = "text" name = "codigoTipoTarefa" id = "idCodTarefa" class = "form-control" value = "${chaveHonorarioAlterado.codigoTipoTarefa}">
   </div>
   <div class = "form-group">
    <label for = "idCodProcesso">C�digo Processo</label>
    <input type = "text" name = "codigoProcesso" id = "idCodProcesso" class = "form-control" value = "${chaveHonorarioAlterado.codigoProcesso}" readonly>
   </div>
   <div class = "form-group">
    <label for = "idDataHonorario">Data Honor�rio*</label>
    <p>*Antes de alterar, mude a data para o formato dd/mm/yyyy</p>
    <input type = "text" name = "dataHonorario" id = "idDataHonorario" class = "form-control" value = "${chaveHonorarioAlterado.dataHonorario}">
   </div>
   <div class = "form-group">
    <label for = "idQuantHora">Quantidade Horas</label>
    <input type = "text" name = "quantidadeHora" id = "idQuantHora" class = "form-control" value = "${chaveHonorarioAlterado.quantidadeHora}">
   </div>
   <div class = "form-group">
   <label for = "idObs">Observa��o</label>
   <input type = "text" name = "observacao" id = "idObs" class = "form-control" value = "${chaveHonorarioAlterado.observacao}">
   </div>
   <input type = "submit" value = "Alterar" class = "btn btn-primary">
  </form>
 </div>
</div>
</body>
</html>