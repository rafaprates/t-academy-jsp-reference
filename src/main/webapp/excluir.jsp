<%@page import="com.carrinho.DAO.ProdutoDAO" %>

<%
    String id = request.getParameter("id");
    ProdutoDAO.excluir(id);
    response.sendRedirect("consultar.jsp");
%>