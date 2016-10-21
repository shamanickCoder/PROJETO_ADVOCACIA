package br.com.fiap.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.fiap.beans.LancaHonorario;

/**
 * Esta aplicação busca honorários no banco de dados, através de um código de processo
 * e um código de lançamento de honorários, possibilitando a criação, listagem, busca individual,
 * alteração e remoção de honorários específicados pelo usuário.
 * @author Christian Perrone, Joyce Silva, Lucas Stern, Matheus Tavares
 * @version1.5
 * @since1.0
 * @see ../beans/LancaHonorario.java
 * @see ../beans/Processo.java
 * @see ../conexao/ConnectionFactory.java
 * */

public class LancarHonorarioDAO{
	/**
	 * Metodo que <b>cria</b> uma nova tuplas da tabela T_AM_ART_LANCA_HONORARIO
	 * referente a um processo
	 * @param LancaHonorario lancaHonorario
	 * @param Connection c 
	 * @throws Exception
	 */
	public void create(LancaHonorario lancaHonorario, Connection c) throws Exception{
		String comando = "INSERT INTO T_AM_ART_LANCA_HONORARIO (CD_LANCAMENTO, CD_TIPO_TAREFA, NR_PROCESSO, DT_HONORARIO, QT_HORA, DS_OBSERVACAO) values (SQ_AM_ART_LANCA_HONORARIO.nextval, ?, ?, ?, ?, ?)";
		PreparedStatement struct  = c.prepareStatement(comando);
		
		struct.setInt(1, lancaHonorario.getCodigoTipoTarefa());
		struct.setInt(2, lancaHonorario.getCodigoProcesso());
		struct.setString(3, lancaHonorario.getDataHonorario());
		struct.setDouble(4, lancaHonorario. getQuantidadeHora());
		struct.setString(5, lancaHonorario. getObservacao());
		struct.execute();
		struct.close();
		System.out.println("Gravado com sucesso!");
	}
	
	/**
	 * Metodo que <b>busca</b> as tuplas da tabela T_AM_ART_LANCA_HONORARIO
	 * referentes a um código de processo definido pelo usuário
	 * retornando a lista de despesa atualizada
	 * @param int nrProcesso
	 * @param Connection c
	 * @return List<LancaHonorario>
	 * @throws Exception
	 */
	public List<LancaHonorario> readList(int nrProcesso, Connection c) throws Exception{
		List<LancaHonorario> listHonorario = new ArrayList<LancaHonorario>();
		PreparedStatement struct = c.prepareStatement("select * from T_AM_ART_LANCA_HONORARIO WHERE NR_PROCESSO = ?");
		
		struct.setInt(1, nrProcesso);
		
		ResultSet result = struct.executeQuery();
		while(result.next()){
			LancaHonorario lancaHonorario = new LancaHonorario();
			lancaHonorario.setCodigoLancamento(result.getInt("CD_LANCAMENTO"));
			lancaHonorario.setCodigoTipoTarefa(result.getInt("CD_TIPO_TAREFA"));
			lancaHonorario.setCodigoProcesso(result.getInt("NR_PROCESSO"));
			lancaHonorario.setDataHonorario(result.getString("DT_HONORARIO"));
			lancaHonorario.setQuantidadeHora(result.getDouble("QT_HORA"));
			lancaHonorario.setObservacao(result.getString("DS_OBSERVACAO"));
			listHonorario.add(lancaHonorario);
		}
		result.close();
		struct.close();
		return listHonorario;
	}
	
    /**
	 * Metodo que <b>busca</b> uma tupla na tabela T_AM_ART_LANCA_HONORARIO
	 * referente a um código de processo definido pelo usuário
	 * retornando o honorário selecionado
	 * @param int numeroProcesso
	 * @param Connection c 
	 * @return LancaHonorario
	 * @throws Exception
	 */
    public LancaHonorario buscaHonorario(int numeroProcesso, int codigoLancamento, Connection c) throws Exception{
        LancaHonorario lancaHonorario = new LancaHonorario();
        PreparedStatement struct = c.prepareStatement("SELECT * FROM T_AM_ART_LANCA_HONORARIO WHERE CD_LANCAMENTO = ? AND NR_PROCESSO = ? ");
        struct.setInt(1, codigoLancamento);
        struct.setInt(2, numeroProcesso);
        ResultSet result = struct.executeQuery();
        if (result.next()){
            lancaHonorario.setCodigoLancamento(result.getInt("CD_LANCAMENTO"));
            lancaHonorario.setCodigoTipoTarefa(result.getInt("CD_TIPO_TAREFA"));
            lancaHonorario.setCodigoProcesso(result.getInt("NR_PROCESSO"));
            lancaHonorario.setDataHonorario(result.getString("DT_HONORARIO"));
            lancaHonorario.setQuantidadeHora(result.getDouble("QT_HORA"));
            lancaHonorario.setObservacao(result.getString("DS_OBSERVACAO"));
         }
         result.close();
         struct.close();
         return lancaHonorario;
    }
    /**
	 * Método que <b>edita</b> uma tupla da tabela T_AM_ART_LANCA_HONORARIO
	 * retornando um numero inteiro, referente à atualização no banco
	 * @param int codigoLanca
	 * @param String data
	 * @param Double hours
	 * @param String obs
	 * @param Connection c
	 * @return int
	 * @throws Exception
	 */
	public int update(int codigoLanca, String data, Double hours, String obs, Connection c) throws Exception{
		
		PreparedStatement struct = c.prepareStatement("update T_AM_ART_LANCA_HONORARIO SET DT_HONORARIO = ?, QT_HORA = ? , DS_OBSERVACAO = ? WHERE CD_LANCAMENTO = ?");
		
		struct.setString(1, data);
		struct.setDouble(2, hours);
		struct.setString(3, obs);
		struct.setInt(4, codigoLanca);
		
		int saida = struct.executeUpdate();
		struct.close();
		return saida;
	}
	 /**
	 * Método que <b>deleta</b> uma tupla da tabela T_AM_ART_LANCA_HONORARIO
	 * atualizando o banco de dados
	 * @param int codigoLancamento
	 * @param Connection c
  	 * @throws Exception
	 */
	public void delete(Connection c, int codigoLancamento) throws Exception{
		PreparedStatement struct = c.prepareStatement("delete FROM  T_AM_ART_LANCA_HONORARIO where CD_LANCAMENTO = ?");
		struct.setInt(1, codigoLancamento);
		struct.execute();
		struct.close();
	}
}