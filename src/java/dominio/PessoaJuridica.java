//@author Iza
package dominio;

import bancodedados.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PessoaJuridica {
    //criação de variaveis
    private Integer idJuridica;
    private String razaoSocial;
    private String nomeFantasia;
    private String cnpj;
    private String email;
    private String telefone;
    private String cep;
    private String estado;
    private String cidade;
    private String bairro;
    private String rua;
    private Integer numero;
    private String complemento;
    private String imagem;
    private String sobrepadaria;
    private String instagram;
    private String facebook;
    private String login;
    private String senha;
    
    //metodos
    String teste;
    public boolean cadastrarConta(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO public.pessoafisica " 
                   +"(razaosocial, nomefantasia, cnpj, login, senha, email, telefone, cep, "
                   +"estado, cidade, bairro, rua, numero, complemento, imagem, sobrepadaria, instagram, facebook) " 
                   +"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.razaoSocial);
            stm.setString(2, this.nomeFantasia);
            stm.setString(3, this.cnpj);
            stm.setString(4, this.login);
            stm.setString(5, this.senha);
            stm.setString(6, this.email);
            stm.setString(7, this.telefone);
            stm.setString(8, this.cep); 
            stm.setString(9, this.estado);
            stm.setString(10, this.cidade);
            stm.setString(11, this.bairro);
            stm.setString(12, this.rua);
            stm.setInt(13, this.numero);
            stm.setString(14, this.complemento);
            stm.setString(15, this.imagem);
            stm.setString(16, this.sobrepadaria);
            stm.setString(17, instagram);
            stm.setString(18, facebook);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    public boolean alterarDados(){
        //comando de execução de banco de dados 
        String sql = "UPDATE pessoafisica " 
                + "SET razaosocial=?, nomefantasia=?, cnpj=?, login=?, senha=?, email=?, "
                + "telefone=?, cep=?, estado=?, cidade=?, bairro=?, rua=?, numero=?, complemento=? "
                + "imagem=?, sobrepadaria=?, instagram=?, facebook=? " 
                + "WHERE cnpj=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.razaoSocial);
            stm.setString(2, this.nomeFantasia);
            stm.setString(3, this.cnpj);
            stm.setString(4, this.login);
            stm.setString(5, this.senha);
            stm.setString(6, this.email);
            stm.setString(7, this.telefone);
            stm.setString(8, this.cep); 
            stm.setString(9, this.estado);
            stm.setString(10, this.cidade);
            stm.setString(11, this.bairro);
            stm.setString(12, this.rua);
            stm.setInt(13, this.numero);
            stm.setString(14, this.complemento);
            stm.setString(15, this.imagem);
            stm.setString(16, this.sobrepadaria);
            stm.setString(17, instagram);
            stm.setString(18, facebook);
            stm.setString(19, this.cnpj);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    public boolean excluirConta(){
        //comando de execução de banco de dados
        String sql = "DELETE FROM pessoajuridica " 
                + "WHERE cnpj=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cnpj);
            //executando comando
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        
        return true;
    }
    
    public PessoaJuridica consultarConta(String pCnpj){
        this.cnpj = pCnpj;
        String sql = "SELECT razaosocial, nomefantasia, cnpj, login, senha, email, telefone, cep, "
                   + "estado, cidade, bairro, rua, numero, complemento, imagem, sobrepadaria, instagram, facebook"
                   + " FROM pessoajuridica where cnpj = ?";
        Connection con = Conexao.conectar();
        PessoaJuridica padaria = null;
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cnpj);
            ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   padaria = new PessoaJuridica();
                   padaria.setRazaoSocial(rs.getString("razaosocial"));
                   padaria.setNomeFantasia(rs.getString("nomefantasia"));
                   padaria.setCnpj(rs.getString("cnpj"));
                   padaria.setLogin(rs.getString("login"));
                   padaria.setSenha(rs.getString("senha"));
                   padaria.setEmail(rs.getString("email"));
                   padaria.setTelefone(rs.getString("telefone"));
                   padaria.setCep(rs.getString("cep")); 
                   padaria.setEstado(rs.getString("estado"));
                   padaria.setCidade(rs.getString("cidade"));
                   padaria.setBairro(rs.getString("bairro"));
                   padaria.setRua(rs.getString("rua"));
                   padaria.setNumero(rs.getInt("numero"));
                   padaria.setComplemento(rs.getString("complemento"));
                   padaria.setImagem(rs.getString("imagem"));
                   padaria.setSobrepadaria(rs.getString("sobrepadaria"));
                   padaria.setInstagram(rs.getString("instagram"));
                   padaria.setFacebook(rs.getString("facebook"));
                } 
        } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
        
        return padaria;
        
    }
    
    public List<PessoaJuridica> consultarGeral(){
        List<PessoaJuridica> lista = new ArrayList<>();
        String sql = "SELECT razaosocial, nomefantasia, cnpj, login, senha, email, telefone, cep, "
                   + "estado, cidade, bairro, rua, numero, complemento, imagem, sobrepadaria, instagram, facebook"
                   + " FROM pessoajuridica";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                PessoaJuridica padaria = new PessoaJuridica();
                padaria.setRazaoSocial(rs.getString("razaosocial"));
                padaria.setNomeFantasia(rs.getString("nomefantasia"));
                padaria.setCnpj(rs.getString("cnpj"));
                padaria.setLogin(rs.getString("login"));
                padaria.setSenha(rs.getString("senha"));
                padaria.setEmail(rs.getString("email"));
                padaria.setTelefone(rs.getString("telefone"));
                padaria.setCep(rs.getString("cep")); 
                padaria.setEstado(rs.getString("estado"));
                padaria.setCidade(rs.getString("cidade"));
                padaria.setBairro(rs.getString("bairro"));
                padaria.setRua(rs.getString("rua"));
                padaria.setNumero(rs.getInt("numero"));
                padaria.setComplemento(rs.getString("complemento"));
                padaria.setImagem(rs.getString("imagem"));
                padaria.setSobrepadaria(rs.getString("sobrepadaria"));
                padaria.setInstagram(rs.getString("instagram"));
                padaria.setFacebook(rs.getString("facebook"));
                lista.add(padaria);
           }
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        
        return lista;
        
    }
    
    
    //getters e setters
    public Integer getIdJuridica() {
        return idJuridica;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    public void setIdJuridica(Integer idJuridica) {
        this.idJuridica = idJuridica;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public String getNomeFantasia() {
        return nomeFantasia;
    }

    public void setNomeFantasia(String nomeFantasia) {
        this.nomeFantasia = nomeFantasia;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getSobrepadaria() {
        return sobrepadaria;
    }

    public void setSobrepadaria(String sobrepadaria) {
        this.sobrepadaria = sobrepadaria;
    }

    public String getInstagram() {
        return instagram;
    }

    public void setInstagram(String instagram) {
        this.instagram = instagram;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }
   
}
