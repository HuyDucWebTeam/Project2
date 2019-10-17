<%@include file="/includes/header.html" %>

<h1>Product</h1>

<%@page import="business.Product" %>

<form id="form_add" method="POST">
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
    <input type="submit" value="Update Product" onclick="update()">
    <input type="submit" value="View Products" onclick="view()">
</form>

<script>
    function update() {
        document.getElementById('form_add').action = 'addProduct';
    }
    function view() {
        document.getElementById('form_add').action = 'viewProduct';
    }
</script>

<%@include file="/includes/footer.jsp" %>
