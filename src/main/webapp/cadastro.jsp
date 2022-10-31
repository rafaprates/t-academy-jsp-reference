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
    <div class="container">
        <form action="cadastro.jsp" method="POST">

          <div class="form-group">
              <label for="descricao">
                Descrição
                <input
                  class="form-control"
                  type="text"
                  name="descricao"
                  id="descricao"
                  placeholder="Informe a descrição do produto"
                  required
                />
              </label>
          </div>

          <div class="form-group">
              <label for="preco">
                Preco
                <input
                  class="form-control"
                  type="number"
                  name="preco"
                  id="preco"
                  placeholder="Informe o preço do produto"
                  required
                />
              </label>
          </div>

          <div class="form-group">
              <label for="estoque">
                Estoque
                <input
                  class="form-control"
                  type="number"
                  name="estoque"
                  id="estoque"
                  placeholder="Informe a quantidade no estoque"
                  required
                />
              </label>
          </div>

          <div class="form-group">
              <label for="unMedida">
                Un. medida
                <input
                  class="form-control"
                  type="text"
                  name="unMedida"
                  id="unMedida"
                  placeholder="Informe a unidade de medida"
                  required
                />
              </label>
          </div>

          <div class="from-group">
              <button class="btn btn-primary">Gravar</button>
          </div>
        </form>
    </div>

    <%
        String descricao = request.getParameter("descricao");
        String preco = request.getParameter("preco");
        String estoque = request.getParameter("estoque");
        String unMedida = request.getParameter("unMedida");

        float parsedPreco = 0.0f;
        int parsedEstoque = 0;

        if (preco != null && !preco.isEmpty()) {
            parsedPreco = Float.parseFloat(preco);
        }

        if (estoque != null && !estoque.isEmpty()) {
            parsedEstoque = Integer.parseInt(estoque);
        }

        if (descricao != null) {
            Produto p = new Produto(descricao, parsedPreco, parsedEstoque, unMedida);
            String retorno = ProdutoDAO.salvar(p);
            out.write("Mensagem: " + retorno);
            response.sendRedirect("consulta.jsp");
        }
    %>
  </body>
</html>

