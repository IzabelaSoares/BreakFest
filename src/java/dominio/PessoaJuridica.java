//@author Iza
package dominio;

import database.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PessoaJuridica {
    //criação de variaveis
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
    private String bairros;
    private String bairroAtendimento;
    private float frete;
    
    //metodos
    
    //cadastro de contas
    public boolean cadastrarConta(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO pessoajuridica (cnpj, razaosocial, nomefantasia, "
                   + "email, telefone, cep, estado, cidade, bairro, rua, "
                   + "numero, complemento, sobrepadaria, bairros) " 
                   + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cnpj);
            stm.setString(2, this.razaoSocial);
            stm.setString(3, this.nomeFantasia);
            stm.setString(4, this.email);
            stm.setString(5, this.telefone);
            stm.setString(6, this.cep); 
            stm.setString(7, this.estado);
            stm.setString(8, this.cidade);
            stm.setString(9, this.bairro);
            stm.setString(10, this.rua);
            stm.setInt(11, this.numero);
            stm.setString(12, this.complemento);
            stm.setString(13, this.sobrepadaria);
            stm.setString(14, this.bairros);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    //alteração de dados
    public boolean alterarDados(String oldCnpj){
        //comando de execução de banco de dados 
        String sql = "UPDATE pessoajuridica " 
                + "SET razaosocial=?, nomefantasia=?, email=?, "
                + "telefone=?, cep=?, estado=?, cidade=?, bairro=?, rua=?, numero=?, complemento=?, "
                + "sobrepadaria=?, bairros=? " 
                + "WHERE cnpj=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.razaoSocial);
            stm.setString(2, this.nomeFantasia);
            stm.setString(3, this.email);
            stm.setString(4, this.telefone);
            stm.setString(5, this.cep); 
            stm.setString(6, this.estado);
            stm.setString(7, this.cidade);
            stm.setString(8, this.bairro);
            stm.setString(9, this.rua);
            stm.setInt(10, this.numero);
            stm.setString(11, this.complemento);
            stm.setString(12, this.sobrepadaria);
            stm.setString(13, this.bairros);
            stm.setString(14, oldCnpj);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    //exclusão de conta
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
    
    //consulta uma conta específica
    public PessoaJuridica consultarConta(String pCnpj){
        this.cnpj = pCnpj;
        String sql = "SELECT cnpj, razaosocial, nomefantasia, email, telefone, cep, "
                   + "estado, cidade, bairro, rua, numero, complemento, sobrepadaria, bairros, instagram, facebook"
                   + " FROM pessoajuridica where cnpj = ?";
        Connection con = Conexao.conectar();
        PessoaJuridica padaria = null;
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cnpj);
            ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   padaria = new PessoaJuridica();
                   padaria.setCnpj(rs.getString("cnpj"));
                   padaria.setRazaoSocial(rs.getString("razaosocial"));
                   padaria.setNomeFantasia(rs.getString("nomefantasia"));
                   padaria.setEmail(rs.getString("email"));
                   padaria.setTelefone(rs.getString("telefone"));
                   padaria.setCep(rs.getString("cep")); 
                   padaria.setEstado(rs.getString("estado"));
                   padaria.setCidade(rs.getString("cidade"));
                   padaria.setBairro(rs.getString("bairro"));
                   padaria.setRua(rs.getString("rua"));
                   padaria.setNumero(rs.getInt("numero"));
                   padaria.setComplemento(rs.getString("complemento"));
                   padaria.setSobrepadaria(rs.getString("sobrepadaria"));
                   padaria.setBairros(rs.getString("bairros"));
                   padaria.setInstagram(rs.getString("instagram"));
                   padaria.setFacebook(rs.getString("facebook"));
                } 
        } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }       
        return padaria;       
    }
    
    //consultar conta especifica dados para chave-pix
       public PessoaJuridica consultarDados(String pCnpj){
        this.cnpj = pCnpj;
        String sql = "select  cnpj, email, telefone from pessoajuridica where cnpj = ?";
        Connection con = Conexao.conectar();
        PessoaJuridica padaria = null;
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cnpj);
            ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   padaria = new PessoaJuridica();
                   padaria.setCnpj(rs.getString("cnpj"));
                   padaria.setEmail(rs.getString("email"));
                   padaria.setTelefone(rs.getString("telefone"));
                } 
        } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }       
        return padaria;       
    }
    
    //consulta todos exceto o BreakFest
    public List<PessoaJuridica> consultarGeral(){
        List<PessoaJuridica> lista = new ArrayList<>();
        String sql = "SELECT* FROM pessoajuridica WHERE cnpj != 'XX.XXX.XXX/0001-XX'";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                PessoaJuridica padaria = new PessoaJuridica();
                padaria.setCnpj(rs.getString("cnpj"));
                padaria.setRazaoSocial(rs.getString("razaosocial"));
                padaria.setNomeFantasia(rs.getString("nomefantasia"));
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
                padaria.setBairros(rs.getString("bairros"));
                padaria.setInstagram(rs.getString("instagram"));
                padaria.setFacebook(rs.getString("facebook"));
                lista.add(padaria);
           }
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        
        return lista;
        
    }
    
    //verifica no banco se já existe o cnpj
    public boolean verificaExistenciaCnpj(String cnpj){
        Connection con = Conexao.conectar();
        String sql = "select * from pessoajuridica where cnpj = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cnpj);
            ResultSet rs = stm.executeQuery();
            return rs.next();         
        }catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;
    }
    
    //verifica no banco se o email já foi usado no cadastro físico
    public boolean verificaExistenciaFisica(String email){
        Connection con = Conexao.conectar();
        String sql = "select * from pessoafisica where email = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            return rs.next();         
        }catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;
    }
    
    //método para verificar se a pessoa possue redes sociais cadastradas no perfil
    public boolean verificaSociais(String email){
        Connection con = Conexao.conectar();
        String sql = "select instagram from pessoajuridica where email = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            return rs.next();       
        }catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;
    }
    
    //método para procurar cnpj pelo email
    public String procuraCnpj(String email){
        String pCnpj = null;
        Connection con = Conexao.conectar();
        String sql = "select cnpj from pessoajuridica where email = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                pCnpj = rs.getString("cnpj");
            }
        }catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        
        return pCnpj;
    }
       
    //cadastro de mídias sociais
    public boolean cadastrarMidias(){
        //comando de execução de banco de dados
        String sql = "update pessoajuridica set instagram=?, facebook=?, imagem=? " 
                   + "where cnpj = ?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.instagram);
            stm.setString(2, this.facebook);
            stm.setString(3, this.imagem);
            stm.setString(4, this.cnpj);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    
        //cadastro de imagem de perfil
    public boolean cadastrarImagem(){
        //comando de execução de banco de dados
        String sql = "update pessoajuridica set imagem=? where cnpj = ?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.imagem);
            stm.setString(2, this.cnpj);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    //cadastra os bairros e seus respectivos fretes
    public boolean cadastrarBairroFrete(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO bairrofrete (fkcnpj, bairro, frete) " 
                   + "VALUES(?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cnpj);
            stm.setString(2, this.bairroAtendimento);
            stm.setFloat(3, this.frete);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    //getters e setters
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

    public String getBairros() {
        return bairros;
    }

    public void setBairros(String bairros) {
        this.bairros = bairros;
    }

    public String getBairroAtendimento() {
        return bairroAtendimento;
    }

    public void setBairroAtendimento(String bairroAtendimento) {
        this.bairroAtendimento = bairroAtendimento;
    }

    public float getFrete() {
        return frete;
    }

    public void setFrete(float frete) {
        this.frete = frete;
    }
    
}
