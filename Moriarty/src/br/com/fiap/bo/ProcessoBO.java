package br.com.fiap.bo;
import java.sql.Connection;
import java.util.List;

import br.com.fiap.beans.Processo;
import br.com.fiap.dao.ProcessoDAO;

public class ProcessoBO {
	ProcessoDAO dao = new ProcessoDAO();
	
	public List<Processo> getLista(Connection conexao) throws Exception{
		
		return dao.getLista(conexao);
	}

	public Processo buscarPorNumeroProcesso(int numeroProcesso, Connection conexao) throws Exception{
		
		return dao.buscarPorNumeroProcesso(numeroProcesso, conexao);
	}
}
