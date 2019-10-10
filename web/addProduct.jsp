<!--Le Quoc Huy - B16DCCN176 - Nhom 8-->
<!--Nguyen Manh Duc - B16DCCN080 - Nhom 8-->
<%@include file="/includes/header.html" %>

<h1>Product</h1>

<%@page import="business.Product" %>
<form action="addProduct" method="post">
    <table cellspacing="0" border="0">
        <tr>
            <td align="right">Product Code:</td>
            <td><input type="text" name="code"></td>
        </tr>
        <tr>
            <td align="right">Product Description:</td>
            <td><input type="text" name="description"></td>
        </tr>
        <tr>
            <td align="right">Product Price:</td>
            <td><input type="text" name="price"></td>
        </tr>
    </table>
    <br>
    <br>
    <input fo type="submit" value="Update Product">
</form>

<br>
<br>
<form action="viewProduct" method="get">
    <input type="submit" value="View Products">
</form>

<%@include file="/includes/footer.jsp" %>
