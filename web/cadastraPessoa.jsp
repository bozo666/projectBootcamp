<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*"%>

<%
	try {
		DadosPessoa d = new DadosPessoa();
                
		Pessoa p = new Pessoa();
		String valor = "";
                valor = request.getParameter("nomePessoa");
		p.setNome(valor);
                valor = request.getParameter("emailPessoa");
		p.setEmail(valor);
                valor = request.getParameter("estadoCivilPessoa");
		p.setEstado_civil(valor);
                valor = request.getParameter("obsPessoa");
		p.setObs(valor);
                valor = request.getParameter("sexoPessoa");
		p.setSexo(valor);
                valor = request.getParameter("senhaPessoa");
		p.setSenha(valor);

		d.cadastrarPessoa(p);
		out.println("Cadastro com sucesso");

	} catch (Exception e) {
		out.println(e.getMessage());
	}
%>