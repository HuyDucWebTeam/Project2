<!--Le Quoc Huy - B16DCCN176 - Nhom 8-->
<!--Nguyen Manh Duc - B16DCCN080 - Nhom 8-->
<%@include file="/includes/header.html" %>

<h1>Products</h1>

<form action="addProductPage.jsp" method="post">
    <table cellspacing="1" border="2">
        <thead>
        <td>Code</td>
        <td>Description</td>
        <td>Price</td>
        <td></td>
        <td></td>
        </thead>
        <%@ page import="static data.ProductIO.productList"
                 %>
        <%@ page import="business.Product" %>

        <%
            for (Product p : productList) {
        %>
        <tr>
            <td><%=p.getCode()%></td>
            <td><%=p.getDescription()%></td>
            <td><%=p.getPrice()%>$</td>
            <td><a href="editProductPage.jsp?code=<%=p.getCode()%>&description=<%=p.getDescription()%>&price=<%=p.getPrice()%>">Edit</a></td>
            <td><a href="deleteProductPage.jsp?code=<%=p.getCode()%>&description=<%=p.getDescription()%>&price=<%=p.getPrice()%>">Delete</a></td>
        </tr>
        <%
            }
        %>
    </table>
    <br>
    <br>
    <input type="submit" value="Add Product">
</form>

<%@include file="/includes/footer.jsp" %>
