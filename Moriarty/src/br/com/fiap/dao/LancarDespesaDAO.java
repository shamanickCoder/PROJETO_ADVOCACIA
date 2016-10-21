package br.com.fiap.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.fiap.beans.LancaDespesa;
import br.com.fiap.beans.Processo;
import br.com.fiap.beans.TipoDespesa;

/**
 * Esta aplicação busca depesas no banco de dados, através de um código de processo
 * e um código de lançamento de despesas, possibilitando a criação, listagem, busca individual,
 * alteração e remoção de despesas específicadas pelo usuário.
 * @author Christian Perrone, Joyce Silva, Lucas Stern, Matheus Tavares
 * @version1.5
 * @since1.0
 * @see ../beans/LancaDepesa.java
 * @see ../beans/ProcessoDespesa.java
 * @see ../conexao/ConnectionFactory.java
 * */
 
    public class LancarDespesaDAO{
    	
    	/**
    	 * Metodo que <b>cria</b> uma nova tuplas da tabela T_AM_ART_LANCA_DESPESA
    	 * referente a um processo
    	 * @param LancaDespesa lancaDespesa
    	 * @param Connection c 
    	 * @throws Exception
    	 */
    	
        public void create(LancaDespesa lancaDespesa, Connection c) throws Exception{
            String comando = "INSERT INTO T_AM_ART_LANCA_DESPESA (CD_LANCAMENTO, CD_TIPO_DESPESA, NR_PROCESSO, DT_DESPESA, VL_DESPESA, DS_OBSERVACAO) values (SQ_AM_ART_LANCA_DESPESA.nextval, ?, ?, ?, ?, ?)";
            
            PreparedStatement struct = c.prepareStatement(comando);
           
        	struct.setInt(1, lancaDespesa.getCodigoTipoDespesa());
        	struct.setInt(2, lancaDespesa.getNumero());
            struct.setString(3, lancaDespesa.getDataDespesa());
            struct.setDouble(4, lancaDespesa.getValorDespesa());
            struct.setString(5, lancaDespesa.getDescricao());
            struct.execute();         
            struct.close();
            
            System.out.println("Gravado com sucesso!");
        }
        
        /**
    	 * Metodo que <b>busca</b> as tuplas da tabela T_AM_ART_LANCA_DESPESA
    	 * referentes a um código de processo definido pelo usuário
    	 * retornando a lista de despesa atualizada
    	 * @param int nrProcesso
    	 * @param Connection c
    	 * @return List<LancaDespesa>
    	 * @throws Exception
    	 */
        
        public List<LancaDespesa> readList(int nrProcesso, Connection c) throws Exception{
            List<LancaDespesa> listDespesa = new ArrayList<LancaDespesa>();
            
            PreparedStatement struct = c.prepareStatement("SELECT * FROM T_AM_ART_LANCA_DESPESA WHERE NR_PROCESSO = ?");
            
            struct.setInt(1, nrProcesso);
            
            ResultSet result = struct.executeQuery();
            while (result.next()){
            	
            	LancaDespesa lancaDespesa = new LancaDespesa();
            	
            	lancaDespesa.setCodigoLancamento(result.getInt("CD_LANCAMENTO"));
            	lancaDespesa.setCodigoTipoDespesa(result.getInt("CD_TIPO_DESPESA"));
            	lancaDespesa.setNumero(result.getInt("NR_PROCESSO"));
            	lancaDespesa.setDataDespesa(result.getString("DT_DESPESA"));
                lancaDespesa.setValorDespesa(result.getDouble("VL_DESPESA"));
                lancaDespesa.setDescricao(result.getString("DS_OBSERVACAO"));
                listDespesa.add(lancaDespesa);               
            }
            result.close();
            struct.close();
            return listDespesa;           
        }
        
        /**
    	 * Método que <b>busca</b> uma tupla na tabela T_AM_ART_LANCA_DESPESA
    	 * @param int numeroProcesso
    	 * @param Connection c
    	 * Metodo que busca uma despesa na tabela T_AM_ART_LANCA_HONORARIO
    	 * referente a um código de processo definido pelo usuário
    	 * retornando a despesa selecionada
    	 * @return LancaDespesa
    	 * @throws Exception
    	 */
        public LancaDespesa buscaDespesa(int numeroProcesso, int codigoLancamento, Connection c) throws Exception{
            LancaDespesa lancaDespesa = new LancaDespesa();
            PreparedStatement struct = c.prepareStatement("select * from T_AM_ART_LANCA_DESPESA where NR_PROCESSO = ? and CD_LANCAMENTO = ?");
            struct.setInt(1, numeroProcesso);
            struct.setInt(2, codigoLancamento);
            
            ResultSet result = struct.executeQuery();
            if(result.next()){
                lancaDespesa.setCodigoLancamento(result.getInt("CD_LANCAMENTO"));
                lancaDespesa.setCodigoTipoDespesa(result.getInt("CD_TIPO_DESPESA"));
                lancaDespesa.setNumero(result.getInt("NR_PROCESSO"));
                lancaDespesa.setDataDespesa(result.getString("DT_DESPESA"));
                lancaDespesa.setValorDespesa(result.getDouble("VL_DESPESA"));
            }
            result.close();
            struct.close();
            return lancaDespesa;
        }
        /**
    	 * Método que <b>edita</b> uma tupla da tabela T_AM_ART_LANCA_DESPESA
    	 * retornando um numero inteiro, referente à atualização no banco
    	 * @param int codigoLancamento
    	 * @param String data
    	 * @param Double valor
    	 * @param String desc
    	 * @param Connection c
    	 * @return int
    	 * @throws Exception
    	 */
        public int update(int codigoLancamento, String data, Double valor, String desc, Connection c) throws Exception{
            PreparedStatement struct = c.prepareStatement("update T_AM_ART_LANCA_DESPESA set DT_DESPESA = ?, VL_DESPESA = ?, DS_OBSERVACAO = ? where CD_LANCAMENTO = ?");
            struct.setString(1, data);
            struct.setDouble(2, valor);
            struct.setString(3, desc);
            struct.setInt(4, codigoLancamento);
            int saida = struct.executeUpdate();
            struct.close();
            return saida;
       
        }
        /**
    	 * Método que <b>deleta</b> uma tupla da tabela T_AM_ART_LANCA_DESPESA
    	 * atualizando o banco de dados
    	 * @param int codigoLanca
    	 * @param Connection c
      	 * @throws Exception
    	 */
        public void delete(int codigoLanca,Connection c) throws Exception{
        	PreparedStatement struct = c.prepareStatement("delete from T_AM_ART_LANCA_DESPESA where CD_LANCAMENTO = ?");
            struct.setInt(1, codigoLanca);
                                   
            struct.execute();
            struct.close();
            
        }
        
    }
    
