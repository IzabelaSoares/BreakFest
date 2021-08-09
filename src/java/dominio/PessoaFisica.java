///@author Maria

package dominio;

import bancodedados.Conexao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PessoaFisica {
    //criação de variáveis
    private Integer idFisica; 
    private String nome;
    private String sobrenome;
    private String cpf;
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
    
    //cadastro de conta
    public boolean cadastrarConta(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO pessoafisica " 
                   +"(nome, sobrenome, cpf, datanascimento, email, celular, cep, estado, cidade, "
                   +"bairro, rua, numero, complemento) " 
                   +"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.sobrenome);
            stm.setString(3, this.cpf);
            stm.setDate(4, this.dataNascimento);
            stm.setString(5, this.email);
            stm.setString(6, this.celular);
            stm.setString(7, this.cep); 
            stm.setString(8, this.estado);
            stm.setString(9, this.cidade);
            stm.setString(10, this.bairro);
            stm.setString(11, this.rua);
            stm.setInt(12, this.numero);
            stm.setString(13, this.complemento);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    //alteração de conta
    public boolean alterarDados(){
        //comando de execução de banco de dados 
        String sql = "UPDATE pessoafisica " 
                + "SET nome=?, sobrenome=?, cpf=?, datanascimento=?, email=?, "
                + "celular=?, cep=?, estado=?, cidade=?, bairro=?, rua=?, numero=?, complemento=? " 
                + "WHERE cpf=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.sobrenome);
            stm.setString(3, this.cpf);
            stm.setDate(4, this.dataNascimento);
            stm.setString(5, this.email);
            stm.setString(6, this.celular);
            stm.setString(7, this.cep); 
            stm.setString(8, this.estado);
            stm.setString(9, this.cidade);
            stm.setString(10, this.bairro);
            stm.setString(11, this.rua);
            stm.setInt(12, this.numero);
            stm.setString(13, this.complemento);
            stm.setString(14, this.cpf);
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
    
    //consulta uma conta específica
    public PessoaFisica consultarConta(String pCpf){
        this.cpf = pCpf;
        String sql = "SELECT nome, sobrenome, "
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
                   pessoa.setSobrenome(rs.getString("sobrenome"));
                   pessoa.setCpf(rs.getString("cpf"));
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
    
   //verifica no banco se o cpf já foi usado
    public boolean verificaExistenciaCpf(String cpf){
        Connection con = Conexao.conectar();
        String sql = "select * from pessoafisica where cpf = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpf);
            ResultSet rs = stm.executeQuery();
            return rs.next();            
        } 
            catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            }
        return true;
    }  
    
    //verifica no banco se o email já foi usado no cadastro jurídico
    public boolean verificaExistenciaJuridica(String email){
        Connection con = Conexao.conectar();
        String sql = "select * from pessoajuridica where email = ?";
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

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
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
