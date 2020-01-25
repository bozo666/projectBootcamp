package entities;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sqlConnect.Conexao;

public class DadosPessoa extends Conexao{

	public void cadastrarPessoa(Pessoa p) throws SQLException, Exception {
		// instrucao a ser executada
		String sql = "INSERT INTO pessoas (Nome, Email, Senha, Sexo, EstadoCivil, Obs) ";
		sql += " VALUES (?,?,?,?,?,?)";
		// preparando a instru��o
		PreparedStatement preparedStatement = conectar().prepareStatement(sql);
		// passando os valores para os parametros
		preparedStatement.setString(1, p.getNome());
		preparedStatement.setString(2, p.getEmail());
		preparedStatement.setString(3, p.getSenha());
		preparedStatement.setString(4, p.getSexo());
		preparedStatement.setString(5, p.getEstado_civil());
		preparedStatement.setString(6, p.getObs());
		// execute insert SQL stetement
		preparedStatement.executeUpdate();
		// fechando a conex�o com o banco de dados
		desconectar();
	}
        
        
        
      
        public ArrayList<Pessoa> listar(Pessoa filtro) throws Exception {
		ArrayList<Pessoa> retorno = new ArrayList<>();

		int pos = 1;
		// instrução sql correspondente a inserção do aluno
		String sql = " select p.Nome, p.Email, p.Senha, p.Sexo, p.EstadoCivil, p.Obs ";
		sql += " from pessoas as p ";
		
		// preparando a instrução
		PreparedStatement preparedStatement = conectar().prepareStatement(sql);

		
		if (filtro.getNome() != null && filtro.getNome().trim().equals("") == false) {
			preparedStatement.setString(pos, "%" + filtro.getNome() + "%");
			pos++;
		}
		// executando a instrução sql
		ResultSet leitor = preparedStatement.executeQuery();
		// lendo os resultados
		while (leitor.next()) {
			Pessoa p = new Pessoa();
			p.setNome(leitor.getString("Nome"));
                        p.setEmail(leitor.getString("Email"));
                        p.setSenha(leitor.getString("Senha"));
                        p.setEstado_civil(leitor.getString("EstadoCivil"));
                        p.setObs(leitor.getString("Obs"));
                        p.setSexo(leitor.getString("Sexo"));
			retorno.add(p);
		}
		// fechando a conexão com o banco de dados
		desconectar();
		return retorno;
	}
        

	
}
