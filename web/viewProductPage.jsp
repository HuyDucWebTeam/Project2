<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <c:forEach items="${sessionScope.productList}" var="product">
            <tr>
                <td>${product.code}</td>
                <td>${product.description}</td>
                <td>${product.price}</td>
                <td><a href="editProductPage.jsp?code=${product.code}&description=${product.description}&price=${product.price}">Edit</a></td>
                <td><a href="deleteProductPage.jsp?code=${product.code}&description=${product.description}&price=${product.price}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <br>
    <input type="submit" value="Add Product">
</form>

<%@include file="/includes/footer.jsp" %>
