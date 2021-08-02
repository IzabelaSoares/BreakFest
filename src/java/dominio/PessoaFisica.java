///@author Maria

package dominio;

import bancodedados.Conexao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PessoaFisica {
    //criação de variáveis
    private Integer idFisica; 
    private String nome;
    private String cpf;
    private String login;
    private String senha;
    private Date dataNascimento;
    private String email;
    private String celular;
    private String cep; 
    private String estado;
    private String cidade;
    private String bairro;
    private String rua;
    private Integer numero;
    private String complemento;
    
    //métodos
    public boolean cadastrarConta(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO public.pessoafisica " 
                   +"(nome, cpf, login, senha, datanascimento, email, celular, cep, estado, cidade, "
                   +"bairro, rua, numero, complemento) " 
                   +"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idFisica); 
            stm.setString(2, this.nome);
            stm.setString(3, this.cpf);
            stm.setString(4, this.login);
            stm.setString(4, this.senha);
            stm.setDate(6, this.dataNascimento);
            stm.setString(7, this.email);
            stm.setString(8, this.celular);
            stm.setString(9, this.cep); 
            stm.setString(10, this.estado);
            stm.setString(11, this.cidade);
            stm.setString(12, this.bairro);
            stm.setString(13, this.rua);
            stm.setInt(14, this.numero);
            stm.setString(15, this.complemento);
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
                + "SET nome=?, cpf=?, login=?, senha=?, datanascimento=?, email=?, "
                + "celular=?, cep=?, estado=?, cidade=?, bairro=?, rua=?, numero=?, complemento=? " 
                + "WHERE cpf=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.cpf);
            stm.setString(3, this.login);
            stm.setString(4, this.senha);
            stm.setDate(5, this.dataNascimento);
            stm.setString(6, this.email);
            stm.setString(7, this.celular);
            stm.setString(8, this.cep); 
            stm.setString(9, this.estado);
            stm.setString(10, this.cidade);
            stm.setString(11, this.bairro);
            stm.setString(12, this.rua);
            stm.setInt(13, this.numero);
            stm.setString(14, this.complemento);
            stm.setString(15, this.cpf);
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
        String sql = "DELETE FROM pessoafisica " 
                + "WHERE cpf=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpf);
            //executando comando
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        
        return true;
    }
    
    public PessoaFisica consultarConta(String pCpf){
        this.cpf = pCpf;
        String sql = "SELECT idfisica, nome, cpf, login, senha, "
                   + "datanascimento, email, celular, cep, estado, cidade, "
                   + "bairro, rua, numero, complemento FROM pessoafisica where cpf = ?";
        Connection con = Conexao.conectar();
        PessoaFisica pessoa = null;
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpf);
            ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   pessoa = new PessoaFisica();
                   pessoa.setNome(rs.getString("nome"));
                   pessoa.setCpf(rs.getString("cpf"));
                   pessoa.setLogin(rs.getString("login"));
                   pessoa.setSenha(rs.getString("senha"));
                   pessoa.setDataNascimento(rs.getDate("datanascimento"));
                   pessoa.setEmail(rs.getString("email"));
                   pessoa.setCelular(rs.getString("celular"));
                   pessoa.setCep(rs.getString("cep")); 
                   pessoa.setEstado(rs.getString("estado"));
                   pessoa.setCidade(rs.getString("cidade"));
                   pessoa.setBairro(rs.getString("bairro"));
                   pessoa.setRua(rs.getString("rua"));
                   pessoa.setNumero(rs.getInt("numero"));
                   pessoa.setComplemento(rs.getString("complemento"));
                } 
        } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
        
        return pessoa;
        
    }
    
    public List<PessoaFisica> consultarGeral(){
        List<PessoaFisica> lista = new ArrayList<>();
        String sql = "select * from pessoafisica order by cpf";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                PessoaFisica pessoa = new PessoaFisica();
                pessoa.setNome(rs.getString("nome"));
                pessoa.setCpf(rs.getString("cpf"));
                pessoa.setLogin(rs.getString("login"));
                pessoa.setSenha(rs.getString("senha"));
                pessoa.setDataNascimento(rs.getDate("datanascimento"));
                pessoa.setEmail(rs.getString("email"));
                pessoa.setCelular(rs.getString("celular"));
                pessoa.setCep(rs.getString("cep")); 
                pessoa.setEstado(rs.getString("estado"));
                pessoa.setCidade(rs.getString("cidade"));
                pessoa.setBairro(rs.getString("bairro"));
                pessoa.setRua(rs.getString("rua"));
                pessoa.setNumero(rs.getInt("numero"));
                pessoa.setComplemento(rs.getString("complemento"));
                lista.add(pessoa);
           }
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        
        return lista;
        
    }

    //getters e setters
    public Integer getIdFisica() {
        return idFisica;
    }

    public void setIdFisica(Integer idFisica) {
        this.idFisica = idFisica;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
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

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
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
    
}
