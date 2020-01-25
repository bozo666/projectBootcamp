<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.*"%>

 <select multiple class="form-control" id="listarNomes" name="listarNomes">
<%
	try {
		DadosPessoa d = new DadosPessoa();
                
		Pessoa p = new Pessoa();
           
                ArrayList<Pessoa> lista = d.listar(p);
                String str ="";
                for(Pessoa p2: lista){

                str += "<option val="+ p2.getId() + ">" + p2.getNome()+ "</option>";
                }
                out.print(str);

	} catch (Exception e) {
		out.println(e.getMessage());
	}
%>
 </select>