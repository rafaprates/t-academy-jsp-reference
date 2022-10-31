<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="com.carrinho.Entidades.Produto" %>
<%@page import="com.carrinho.DAO.ProdutoDAO" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Cadastro</title>
  </head>
  <body>
    <%
        String id = request.getParameter("id");
        Produto p = ProdutoDAO.consultarPorId(id);
    %>

    <div class="container">
        <form action="" method="POST">
          <label class="form-label" for="id">Id</label>
            <input
              class="form-control"
              type="text"
              name="id"
              id="id"
              value=<%out.write(""+p.getId());%>
              readonly
            />

          <label class="form-label" for="descricao">Descrição</label>
            <input
              class="form-control"
              type="text"
              name="descricao"
              id="descricao"
              value="<%out.write(p.getDescricao());%>"
              required
            />

          <label for="preco">Preco</label>
            <input
              class="form-control"
              type="number"
              name="preco"
              id="preco"
              value=<%out.write(""+p.getPreco());%>
              required
            />

          <label for="estoque">Estoque</label>
            <input
              class="form-control"
              type="number"
              name="estoque"
              id="estoque"
              value=<%out.write(""+p.getEstoque());%>
              required
            />

           <label for="unMedida">Un. de medida</label>
           <select class="form-control" id"unidadeMedida">
                <option value="un">un.</option>
                <option value="kg">Kg</option>
                <option value="litro">Litro</option>
           </select>

          <div class="from-group mt-2">
              <button class="btn btn-warning">Alterar</button>
          </div>
        </form>
    </div>

    <%
        if (request.getMethod() == "POST") {
            String descricao = request.getParameter("descricao");
            String preco = request.getParameter("preco");
            String estoque = request.getParameter("estoque");
            String unMedida = request.getParameter("unMedida");

            ProdutoDAO.alterar(id);

            // p.setPreco(Float.parseFloat(preco));
            // p.setPreco(Integer.parseInt(estoque));
        }
    %>
  </body>
</html>

