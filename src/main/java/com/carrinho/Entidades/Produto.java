package com.carrinho.Entidades;

public class Produto {
    private int id;
    private String descricao;
    private float preco;
    private int estoque;
    private String unMedida;
    public Produto() {
    }

    public Produto(String descricao, float preco, int estoque, String unMedidade) {
        this.descricao = descricao;
        this.preco = preco;
        this.estoque = estoque;
        this.unMedida = unMedidade;
    }

    public Produto(String descricao, float preco) {
        this.descricao = descricao;
        this.preco = preco;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public int getEstoque() {
        return estoque;
    }

    public void setEstoque(int estoque) {
        this.estoque = estoque;
    }

    public String getUnMedida() {
        return unMedida;
    }

    public void setUnMedida(String unMedida) {
        this.unMedida = unMedida;
    }
}
