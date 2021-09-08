//@author Izabela
package dominio;

import database.Conexao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class Pedido {

    //variaveis produtos pedido
    private String produto;
    private Integer quantidade;
    private Double precoUn;
    private Double precoTotal;
    private Integer idPedido;
    
    //variaveis pedido
    private String fkCpf;
    private String fkCnpj;
    private String status;
    private Boolean recorrencia;
    private String observacao;
    private Date dataPedido;
    private String cep;
    private String estado;
    private String cidade;
    private String bairro;
    private String rua;
    private Integer numero;
    private String complemento;
    private Double totalCompra;
    
    //variaveis usuario fisico
    private String nome;
    private String sobrenome;
    private String celular;
    
    //variaveis usuario juridico
    private String nomeFantasia;
    private String telefone;

    //variáveis diasemana
    private int id;
    private int fkPedido;
    private String dia;
    private Time hora;

    //metodos
    public boolean cadastrarPedido() {
        //comando de execução de banco de dados
        String sql = "INSERT INTO public.pedido (fkcpf, fkcnpj, observacao, datapedido, "
                + "status, recorrencia, cep, estado, cidade, bairro, rua, numero, complemento, totalcompra)"
                + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCpf);
            stm.setString(2, this.fkCnpj);
            stm.setString(3, this.observacao);
            stm.setDate(4, this.dataPedido);
            stm.setString(5, this.status);
            stm.setBoolean(6, this.recorrencia);
            stm.setString(7, this.cep);
            stm.setString(8, this.estado);
            stm.setString(9, this.cidade);
            stm.setString(10, this.bairro);
            stm.setString(11, this.rua);
            stm.setInt(12, this.numero);
            stm.setString(13, this.complemento);
            stm.setDouble(14, this.totalCompra);
            //executando comando
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterarPedido() {
        //comando de execução de banco de dados 
        String sql = "UPDATE public.pedido SET fkcpf=?, fkcnpj=?, observacao=?, "
                + "datapedido=?, status=?, recorrencia=?, cep=?, estado=?, "
                + "cidade=?, bairro=?, rua=?, numero=?, complemento=?, totalcompra=?"
                + "WHERE id=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCpf);
            stm.setString(2, this.fkCnpj);
            stm.setString(3, this.observacao);
            stm.setDate(4, this.dataPedido);
            stm.setString(5, this.status);
            stm.setBoolean(6, this.recorrencia);
            stm.setString(7, this.cep);
            stm.setString(8, this.estado);
            stm.setString(9, this.cidade);
            stm.setString(10, this.bairro);
            stm.setString(11, this.rua);
            stm.setInt(12, this.numero);
            stm.setString(13, this.complemento);
            stm.setDouble(14, this.totalCompra);
            stm.setInt(15, this.idPedido);
            //executando comando
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean excluirPedido() {
        //comando de execução de banco de dados
        String sql = "DELETE FROM pedido WHERE idpedido=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando o comando com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idPedido);
            //executando comando
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    //consultar todos os pedidos do usuário fisico
    public List<Pedido> consultarPedidosUsuarioJuridico(String pFkCnpj) {
        List<Pedido> lista = new ArrayList<>();
        //comando de execução de banco de dados
        String sql = "SELECT pedido.*, pessoafisica.*, pessoajuridica.* " +
                     "FROM public.pedido pedido, public.pessoafisica pessoafisica, " +
                     "public.pessoajuridica pessoajuridica " +
                     "WHERE pedido.fkcpf = pessoafisica.cpf AND pedido.fkcnpj = pessoajuridica.cnpj " +
                     "AND fkcpf ='"+ pFkCnpj +"'";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando o comando com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                 //adicionando à lista os pedidos
                Pedido pedido = new Pedido();
                //dados da tabela pedido
                pedido.setIdPedido(rs.getInt("id"));
                pedido.setFkCpf(rs.getString("fkcpf"));
                pedido.setFkCnpj(rs.getString("fkcnpj"));
                pedido.setObservacao(rs.getString("observacao"));
                pedido.setDataPedido(rs.getDate("datapedido"));
                pedido.setStatus(rs.getString("status"));
                pedido.setRecorrencia(rs.getBoolean("recorrencia"));
                pedido.setCep(rs.getString("cep"));
                pedido.setEstado(rs.getString("estado"));
                pedido.setCidade(rs.getString("cidade"));
                pedido.setBairro(rs.getString("bairro"));
                pedido.setRua("rua");
                pedido.setComplemento(rs.getString("complemento"));
                pedido.setNumero(rs.getInt("numero"));
                pedido.setTotalCompra(rs.getDouble("totalcompra"));
                //dados da tabela usuario fisico
                pedido.setNome(rs.getString("nome"));
                pedido.setSobrenome(rs.getString("sobrenome"));
                pedido.setCelular("celular");
                //dados da tabela usuario juridico
                pedido.setNomeFantasia(rs.getString("nomefantasia"));
                pedido.setTelefone(rs.getString("telefone"));
                //retorna a lista para a consulta
                lista.add(pedido);
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
        
    //consultar todos os pedidos do usuário fisico
    public List<Pedido> consultarPedidosUsuarioFisico(String pFkCpf) {
        List<Pedido> lista = new ArrayList<>();
        //comando de execução de banco de dados
        String sql = "SELECT pedido.*, pessoafisica.*, pessoajuridica.* " +
                     "FROM public.pedido pedido, public.pessoafisica pessoafisica, " +
                     "public.pessoajuridica pessoajuridica " +
                     "WHERE pedido.fkcpf = pessoafisica.cpf AND pedido.fkcnpj = pessoajuridica.cnpj " +
                     "AND fkcpf ='"+ pFkCpf +"'";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando o comando com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                 //adicionando à lista os pedidos
                Pedido pedido = new Pedido();
                //dados da tabela pedido
                pedido.setIdPedido(rs.getInt("id"));
                pedido.setFkCpf(rs.getString("fkcpf"));
                pedido.setFkCnpj(rs.getString("fkcnpj"));
                pedido.setObservacao(rs.getString("observacao"));
                pedido.setDataPedido(rs.getDate("datapedido"));
                pedido.setStatus(rs.getString("status"));
                pedido.setRecorrencia(rs.getBoolean("recorrencia"));
                pedido.setCep(rs.getString("cep"));
                pedido.setEstado(rs.getString("estado"));
                pedido.setCidade(rs.getString("cidade"));
                pedido.setBairro(rs.getString("bairro"));
                pedido.setRua("rua");
                pedido.setComplemento(rs.getString("complemento"));
                pedido.setNumero(rs.getInt("numero"));
                pedido.setTotalCompra(rs.getDouble("totalcompra"));
                //dados da tabela usuario fisico
                pedido.setNome(rs.getString("nome"));
                pedido.setSobrenome(rs.getString("sobrenome"));
                pedido.setCelular("celular");
                //dados da tabela usuario juridico
                pedido.setNomeFantasia(rs.getString("nomefantasia"));
                pedido.setTelefone(rs.getString("telefone"));
                //retorna a lista para a consulta
                lista.add(pedido);
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
    
    //consultar pedido especifico com todos os dados (pedido, produtos do pedido,pessoa juridica e pessoa fisica) 
    public List<Pedido> consultarPedidoIndividual(Integer pIdPedido) {
        List<Pedido> lista = new ArrayList<>();
        //comando de execução de banco de dados
        String sql = "SELECT pedido.*, pessoafisica.*, pessoajuridica.*, produtospedido.* " +
        "FROM public.pedido pedido, public.pessoafisica pessoafisica, " +
        "public.pessoajuridica pessoajuridica, public.produtospedido produtospedido " +
        "WHERE pedido.fkcpf = pessoafisica.cpf AND pedido.fkcnpj = pessoajuridica.cnpj " +  
        "AND produtospedido.fkpedido = pedido.id and pedido.id = "+ pIdPedido;
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando o comando com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                //adicionando à lista os pedidos
                Pedido pedido = new Pedido();
                //dados da tabela pedido
                pedido.setIdPedido(rs.getInt("id"));
                pedido.setFkCpf(rs.getString("fkcpf"));
                pedido.setFkCnpj(rs.getString("fkcnpj"));
                pedido.setObservacao(rs.getString("observacao"));
                pedido.setDataPedido(rs.getDate("datapedido"));
                pedido.setStatus(rs.getString("status"));
                pedido.setRecorrencia(rs.getBoolean("recorrencia"));
                pedido.setCep(rs.getString("cep"));
                pedido.setEstado(rs.getString("estado"));
                pedido.setCidade(rs.getString("cidade"));
                pedido.setBairro(rs.getString("bairro"));
                pedido.setRua("rua");
                pedido.setComplemento(rs.getString("complemento"));
                pedido.setNumero(rs.getInt("numero"));
                pedido.setTotalCompra(rs.getDouble("totalcompra"));
                //dados da tabela produtos pedido
                pedido.setPrecoUn(rs.getDouble("precounitario"));
                pedido.setQuantidade(rs.getInt("quantidade"));
                pedido.setPrecoTotal(rs.getDouble("precototal"));
                pedido.setProduto(rs.getString("produto"));
                //dados da tabela usuario fisico
                pedido.setNome(rs.getString("nome"));
                pedido.setSobrenome(rs.getString("sobrenome"));
                pedido.setCelular("celular");
                //dados da tabela usuario juridico
                pedido.setNomeFantasia(rs.getString("nomefantasia"));
                pedido.setTelefone(rs.getString("telefone"));
                //retorna a lista para a consulta
                lista.add(pedido);
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }

    //Consultar o Ultimo ID do pedido inserido
    public Integer consultarIdPedido() {
        Integer pedidoProdutoId = 0;
        //comando de execução de banco de dados
        String sql = "SELECT * FROM pedido WHERE id=(SELECT max(id) FROM pedido)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando o comando com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                //adicionando à lista os pedidos               
                pedidoProdutoId = (rs.getInt("id"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return pedidoProdutoId;
    }

    //Inserir na tabela de produtos pedidos
    public boolean cadastrarProdutosPedido() {
        //comando de execução de banco de dados
        String sql = "INSERT INTO public.produtospedido "
                + "(fkpedido, produto, quantidade, precounitario, precototal) "
                + "VALUES(?, ?, ?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idPedido);
            stm.setString(2, this.produto);
            stm.setInt(3, this.quantidade);
            stm.setDouble(4, this.precoUn);
            stm.setDouble(5, this.precoTotal);
            //executando comando
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    
    //gera nova data baseado no dia da semana
    public Date novaData(Date dataPedido, int dia, Time hora){
        Date novaData = null;
        String sql= "select novaData(?, ?, ?)";
        Connection con = Conexao.conectar();       
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setDate(1, dataPedido);
            stm.setInt(2, dia);
            stm.setTime(3, hora);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                novaData = rs.getDate("novadata");
            }
        }catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        
        return novaData;
    }
    
    //faz uma pesquisa no banco do dia da semana atual
    public int verificaDiaSemana(){
        int semana = 0;
        String sql = "select extract(dow from CURRENT_DATE)";
        Connection con = Conexao.conectar();       
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                semana = rs.getInt("date_part");
            }
        }catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        
        return semana;
    }
    
    //cadastra o dia da semana e a hora de acordo com a recorrência
    public boolean cadastrarDiaSemana() {
        //comando de execução de banco de dados
        String sql = "INSERT INTO diasemana (fkpedido, dia, hora)"
                + "VALUES(?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.fkPedido);
            stm.setString(2, this.dia);
            stm.setTime(3, this.hora);
            //executando comando
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    //getters and setters
    public Integer getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(Integer idPedido) {
        this.idPedido = idPedido;
    }

    public String getFkCpf() {
        return fkCpf;
    }

    public void setFkCpf(String fkCpf) {
        this.fkCpf = fkCpf;
    }

    public String getFkCnpj() {
        return fkCnpj;
    }

    public void setFkCnpj(String fkCnpj) {
        this.fkCnpj = fkCnpj;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public Date getDataPedido() {
        return dataPedido;
    }

    public Double getTotalCompra() {
        return totalCompra;
    }

    public void setTotalCompra(Double totalCompra) {
        this.totalCompra = totalCompra;
    }

    public void setDataPedido(Date dataPedido) {
        this.dataPedido = dataPedido;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNomeFantasia() {
        return nomeFantasia;
    }

    public void setNomeFantasia(String nomeFantasia) {
        this.nomeFantasia = nomeFantasia;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Boolean getRecorrencia() {
        return recorrencia;
    }

    public void setRecorrencia(Boolean recorrencia) {
        this.recorrencia = recorrencia;
    }

    public String getProduto() {
        return produto;
    }

    public void setProduto(String produto) {
        this.produto = produto;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public Double getPrecoUn() {
        return precoUn;
    }

    public void setPrecoUn(Double precoUn) {
        this.precoUn = precoUn;
    }

    public Double getPrecoTotal() {
        return precoTotal;
    }

    public void setPrecoTotal(Double precoTotal) {
        this.precoTotal = precoTotal;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFkPedido() {
        return fkPedido;
    }

    public void setFkPedido(int fkPedido) {
        this.fkPedido = fkPedido;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }
    
    
}
