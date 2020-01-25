package entities;

public class Pessoa {
	
	private Integer id;
	private String nome;
	private String email;
	private String senha;
	private String sexo;
	private String estado_civil;
	private String obs;
	
	public Pessoa() {}
	
	public Pessoa(Integer id, String nome, String email, String senha, String sexo, String estado_civil, String obs) {
		this.id = id;
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.sexo = sexo;
		this.estado_civil = estado_civil;
		this.obs = obs;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getEstado_civil() {
		return estado_civil;
	}

	public void setEstado_civil(String estado_civil) {
		this.estado_civil = estado_civil;
	}

	public String getObs() {
		return obs;
	}

	public void setObs(String obs) {
		this.obs = obs;
	}

	
}
