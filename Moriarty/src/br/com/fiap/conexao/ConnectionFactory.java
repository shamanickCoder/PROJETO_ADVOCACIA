package br.com.fiap.conexao;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;

public final class ConnectionFactory {

	private static ConnectionFactory conexao = null;

	public static ConnectionFactory controlarInstancia() {

		if (conexao == null) {
			conexao = new ConnectionFactory();
		}
		return conexao;
	}

	public Connection getConnection() throws Exception{

		//FileReader arquivo = new FileReader(System.getProperty("user.dir") + "/conexao/conexao.txt");
		//BufferedReader dados = new BufferedReader(arquivo);

		String url = "jdbc:oracle:thin:/:@192.168.60.15:1521:ORCL";

		if (url.indexOf("oracle") > 0) {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}

		//dados.close();

		return DriverManager.getConnection(url);
	}
	/*
	public Connection getConnection() throws Exception{

		FileReader arquivo = new FileReader(System.getProperty("user.dir") + "/conexao/conexao.txt");
		BufferedReader dados = new BufferedReader(arquivo);

		String url = dados.readLine();

		if (url.indexOf("oracle") > 0) {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}

		dados.close();

		return DriverManager.getConnection(url);
	}*/
}
