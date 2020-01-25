package entities;

public class Test {

	public static void main(String[] args) {
		
		
		try {
			DadosPessoa d = new DadosPessoa();
			
			Pessoa p = new Pessoa();
			p.setNome("Melo");
			p.setEmail("melo@gmai.com");
			p.setEstado_civil("Casado");
			p.setObs("blablabla");
			p.setSexo("masculino");
			p.setSenha("1231");
			
			d.cadastrarPessoa(p);
			System.out.println("Cadastro com sucesso");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

}
