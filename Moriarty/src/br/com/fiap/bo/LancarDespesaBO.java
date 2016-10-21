package br.com.fiap.bo;

import java.sql.Connection;
import java.util.Calendar;
import java.util.List;

import br.com.fiap.beans.LancaDespesa;
import br.com.fiap.beans.Processo;
import br.com.fiap.dao.LancarDespesaDAO;
import br.com.fiap.excecoes.Excecao;

public class LancarDespesaBO {

	LancarDespesaDAO dao = new LancarDespesaDAO();
	
	
	
	public void create(LancaDespesa ld, Connection c) throws Exception{
		Processo p = new Processo();
		

		if (ld.getValorDespesa() <= 0) {
			throw new Excecao("A quantidade de horas tem que ser maior que 0!");
		}

		if (p.getSituacao() == 1) {
			throw new Excecao("Não é permitido lançar um honorário para um processo bloqueado!");
		}

		if (p.getResultado() == 1) {
			throw new Excecao("Não é permitido lançar um honorário para um processo finalizado!");
		}
		dao.create(ld, c);
	}
	
	public int update(int codigoLancamento, String data, Double valor, String desc, Connection c) throws Exception{
		LancaDespesa ld = new LancaDespesa();
		

		if (ld.getValorDespesa() <= 0) {
			throw new Excecao("A quantidade de horas tem que ser maior que 0!");
		}

		return dao.update(codigoLancamento, data, valor, desc, c);
	}
	
	public List<LancaDespesa> readList(int nrProcesso, Connection c) throws Exception{
		return dao.readList(nrProcesso, c);
	}
	
	public LancaDespesa buscaDespesa(int numeroProcesso, int codigoLancamento, Connection c) throws Exception{
		return dao.buscaDespesa(numeroProcesso, codigoLancamento, c);
	}
	
	public void delete(int codigoLanca, Connection c) throws Exception{
		dao.delete(codigoLanca, c);
	}
}
