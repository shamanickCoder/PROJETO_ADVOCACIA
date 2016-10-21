<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de despesas</title>
<%@ include file = "includes.jsp" %>
</head>
<body>
<%@ include file = "menu.jsp" %>
<div class = "container">
 <h1>Lista de despesas</h1>
 
 <c:if test="${not empty mensagem }">
		<div class="alert alert-danger">
			${mensagem}
		</div>
	   </c:if>
	   <c:if test="${not empty mensagemAlteracao }">
		<div class="alert alert-danger">
			${mensagemAlteracao}
		</div>
	   </c:if>
 
 <table class = "table">
  <tr>
 	<th>Código de lançamento</th>
 	<th>Código Tipo Despesa</th>
 	<th>Número do processo</th>
 	<th>Data da despesa</th>
 	<th>Valor da despesa</th>
 	<th>Descrição</th>
 	<th></th>
 	<th></th>
  </tr>
  <c:forEach var = "listaDespesa" items = "${chaveListaDespesa}">
   <tr>
    <td>${listaDespesa.codigoLancamento}</td>
    <td>${listaDespesa.codigoTipoDespesa}</td>
    <td>${listaDespesa.numero}</td>
    <td>${listaDespesa.dataDespesa}</td>
    <td>${listaDespesa.valorDespesa}</td>
    <td>${listaDespesa.descricao}</td>
    <td>
     <c:url value="buscaServlet" var="link">
						<c:param name="codigoLancamento" value="${listaDespesa.codigoLancamento}"/>
						<c:param name="numeroProcesso" value="${listaDespesa.numero}"></c:param>
						<c:param name="acao" value="alterarDespesaForm"/>
					</c:url>
					<a href="${link}" class="btn btn-info btn-sm">Alterar</a>
    </td>
    <td>
    <c:url value="buscaServlet" var="link">
						<c:param name="codigoLancamento" value="${listaDespesa.codigoLancamento}"/>
						<c:param name="numeroProcesso" value="${listaDespesa.numero}"></c:param>
						<c:param name="acao" value="excluirDespesa"/>
					</c:url>
					<a href="${link}" class="btn btn-info btn-sm">Excluir</a>
    </td>
   </tr>
  </c:forEach>
 </table>
</div>
</body>
</html>