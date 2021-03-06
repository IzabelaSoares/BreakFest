<%-- 
    Documento       : recebealterausuariojuridico
    Desenvolvido por: Maria Clara Peron
    Documentado por : Maria Clara Peron
--%>
<%@page import="dominio.BairrosFrete"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="dominio.UsuarioJuridico"%>
<%@page import="dominio.PessoaJuridica"%>
<%  request.setCharacterEncoding("UTF-8");
    
    //instancia a pessoa física = PF
    PessoaJuridica pj = new PessoaJuridica();
    
    //instanciar o login da = PJ
    UsuarioJuridico login = new UsuarioJuridico();

    String oldCnpj = request.getParameter("cnpj");

    //passa os valores do HMTL para a classe PessoaJuridica
    pj.setRazaoSocial(request.getParameter("razaosocial"));
    pj.setNomeFantasia(request.getParameter("nomefantasia"));
    pj.setEmail(request.getParameter("email"));
    pj.setTelefone(request.getParameter("telefone"));
    pj.setCep(request.getParameter("cep"));
    pj.setEstado(request.getParameter("estado"));
    pj.setCidade(request.getParameter("cidade"));
    pj.setBairro(request.getParameter("bairro"));
    pj.setRua(request.getParameter("rua"));
    pj.setNumero(Integer.parseInt(request.getParameter("numero")));
    pj.setComplemento(request.getParameter("complemento"));
    pj.setSobrepadaria(request.getParameter("sobre"));
    pj.setBairros(request.getParameter("bairros"));
    
    //passa os valores do HMTL para a classe UsuarioJuridico
    login.setEmail(request.getParameter("email"));
    login.setSenha(request.getParameter("senha"));

    //se cadastrar pessoa e o login dela
    if (pj.alterarDados(oldCnpj) && login.alterarUsuario(oldCnpj)) {
        //instancia a classe bairros frete = bf
        BairrosFrete bf = new BairrosFrete();

        //transforma os bairros em um array
        String bairro = request.getParameter("bairros");
        List<String> bairros = new ArrayList<>(Arrays.asList(bairro.split(", ")));

        //cria um loop que percorre os bairros e os cadastra
        for(int i=0; i < bairros.size(); i++){
            //se o bairro não estiver cadastrado naquele cnpj, cadastra ele
            if(bf.verificaExistenciaBairro(bairros.get(i), oldCnpj) == null){
                bf.setFkCnpj(oldCnpj);
                bf.setBairroAtendimento(bairros.get(i));
                bf.setFrete(0);
                
                bf.cadastrarBairroFrete();
            }
        }
        
        request.getSession().setAttribute("resultado", "CadastroAlterado");
        response.sendRedirect(String.valueOf(request.getSession().getAttribute("pagina"))); 
    } else {
        //erro no cadastro
        request.getSession().setAttribute("resultado", "CadastroNaoAlterado");
        response.sendRedirect(String.valueOf(request.getSession().getAttribute("pagina")));
    }
%>
