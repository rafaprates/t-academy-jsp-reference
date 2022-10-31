<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.carrinho.Entidades.Produto" %>
<%@ page import="com.carrinho.DAO.ProdutoDAO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Consulta</title>
  </head>
  <body>

    <div class="container">
        <table class="table">
            <thead>
                <tr>
                    <th>id</th>
                    <th>Descrição</th>
                    <th>Preço</th>
                    <th>Estoque</th>
                    <th>Un. Medida</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String id = request.getParameter("id");
                    if (id != null && !id.isEmpty()) {
                        Produto p = ProdutoDAO.consultarPorId(id);
                        out.write("<tr>");
                        out.write("<td>"+p.getId()+"</td>");
                        out.write("<td>"+p.getDescricao()+"</td>");
                        out.write("<td>"+p.getPreco()+"</td>");
                        out.write("<td>"+p.getEstoque()+"</td>");
                        out.write("<td>"+p.getUnMedida()+"</td>");
                        out.write("</tr>");
                    }
                %>
            </tbody>
        </table>

        <form action="alteracao.jsp?id="+<%=request.getParameter("id")%> method="GET">
            <button class="btn btn-warning">Alterar</button>
        </form>

    </div>
  </body>
</html>
