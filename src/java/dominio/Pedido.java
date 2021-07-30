//@author Izabela
package dominio;

import java.sql.Date;

public class Pedido {
    //criação de variaveis
    private Integer idPedido;
    private String fkCpf;
    private String fkCnpj;
    private Integer fkIdProduto;
    private String observacao;
    private Date dataPedido;
    
    //metodos
    
    
    
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

    public Integer getFkIdProduto() {
        return fkIdProduto;
    }

    public void setFkIdProduto(Integer fkIdProduto) {
        this.fkIdProduto = fkIdProduto;
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

    public void setDataPedido(Date dataPedido) {
        this.dataPedido = dataPedido;
    }

}
