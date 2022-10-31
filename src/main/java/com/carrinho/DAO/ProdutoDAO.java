package com.carrinho.DAO;

import com.carrinho.Entidades.Produto;
import com.carrinho.Utils.Conexao;
import com.mysql.cj.x.protobuf.MysqlxPrepare;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProdutoDAO {
    public static List<Produto> produtos = new ArrayList<Produto>();

    public static void add(Produto p) {
       produtos.add(p);
    }

    public static String salvar(Produto p) {
        Connection con = Conexao.conectar();

        if (con != null) {
            String insert = "INSERT INTO produto(descricao, preco, estoque, unidadeMedida)" +
                            "values(?,?,?,?)";

            try {
                PreparedStatement ps = con.prepareStatement(insert);
                ps.setString(1, p.getDescricao());
                ps.setFloat(2, p.getPreco());
                ps.setFloat(3, p.getEstoque());
                ps.setString(4, p.getUnMedida());
                ps.execute();
            } catch (SQLException e) {
                return "Erro: " + e.getMessage();
            }
            return "Registro inserido com sucesso.";
        }
        return "Erro de conexão.";
    }

    public static List<Produto> consultarTodos() {
        List<Produto> produtos = new ArrayList<Produto>();
        Connection con = Conexao.conectar();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM produto");
            ResultSet rs = ps.executeQuery();
            // Transformar o result set em objetos e inseri-lo na lista
            // O primeiro ponteiro fica na linha dos rótulos
            while(rs.next()) {
               Produto p = new Produto();
               p.setDescricao(rs.getString("descricao"));
               p.setPreco(rs.getFloat("preco"));
               p.setEstoque(rs.getInt("estoque"));
               p.setUnMedida(rs.getString("unidadeMedida"));
               produtos.add(p);
            }
        } catch (SQLException e) {
            return produtos;
        }
        return produtos;
    }
}
