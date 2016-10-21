package br.com.fiap.bo;

import java.sql.Connection;
import java.util.Calendar;
import java.util.List;

import br.com.fiap.beans.LancaHonorario;
import br.com.fiap.dao.LancarHonorarioDAO;
import br.com.fiap.excecoes.Excecao;

public class LancarHonorarioBO {
	LancarHonorarioDAO dao = new LancarHonorarioDAO();
	String dataAtual = String.valueOf(Calendar.getInstance());
	Calendar c = Calendar.getInstance();
	String ano = String.valueOf(c.get(Calendar.YEAR));
	//String xpto = ano.split("/")[1];

	public void create(LancaHonorario lancaHonorario, Connection conexao) throws Exception {
		String mesInput = lancaHonorario.getDataHonorario().split("/")[1];

		//if (!xpto.equals(mesInput)) {
			//throw new Excecao("Não é permitida a inserção de um mês que não seja atual!");
		//}

		if (!lancaHonorario.getDataHonorario().equals(dataAtual)) {
			throw new Excecao("Não é permitida a inserção de uma data que não seja atual!");
		}

		if (lancaHonorario.getQuantidadeHora() <= 0) {
			throw new Excecao("A quantidade de horas tem que ser maior que 0!");
		}

		// 1 = BLOQUEADO!!!!
		if (lancaHonorario.getCodigoProcesso() == 1) {
			throw new Excecao("Não é permitido lançar um honorário para um processo bloqueado!");
		}

		// 1 = FINALIZADO!!!!
		if (lancaHonorario.getCodigoProcesso() == 1) {
			throw new Excecao("Não é permitido lançar um honorário para um processo finalizado!");
		}
		dao.create(lancaHonorario, conexao);
	}

	public int update(int codigoLanca, String data, Double hours, String obs, Connection c) throws Exception {
		LancaHonorario lancaHonorario = new LancaHonorario();

		String mesInput = lancaHonorario.getDataHonorario().split("/")[1];

		//if (!xpto.equals(mesInput)) {
			//throw new Excecao("Não é permitida a inserção de um mês que não seja atual!");
		//}

		if (!lancaHonorario.getDataHonorario().equals(dataAtual)) {
			throw new Excecao("Não é permitida a inserção de uma data que não seja atual!");
		}

		if (lancaHonorario.getQuantidadeHora() <= 0) {
			throw new Excecao("A quantidade de horas tem que ser maior que 0!");
		}
		return dao.update(codigoLanca, data, hours, obs, c);
	}

	public List<LancaHonorario> readList(int nrProcesso, Connection c) throws Exception {
		return dao.readList(nrProcesso, c);
	}

	public LancaHonorario buscaHonorario(int numeroProcesso, int codigoLancamento, Connection c) throws Exception{
		return dao.buscaHonorario(numeroProcesso, codigoLancamento, c);
	}
	
	public void delete(Connection c, int codigoLancamento) throws Exception{
		dao.delete(c, codigoLancamento);
	}
}