<%@include file="/includes/header.html" %>

<h1>Product</h1>

<%@page import="business.Product" %>

<%
    String codeMessage = (String) request.getAttribute("codeMessage");
    String descriptionMessage = (String) request.getAttribute("descriptionMessage");
    String priceMessage = (String) request.getAttribute("priceMessage");

    if (codeMessage == null) {
        codeMessage = "";
    }

    if (descriptionMessage == null) {
        descriptionMessage = "";
    }

    if (priceMessage == null) {
        priceMessage = "";
    }

    String code = (String) request.getAttribute("code");
    String description = (String) request.getAttribute("description");
    String price = (String) request.getAttribute("price");

    if (code == null) {
        code = "";
    }

    if (description == null) {
        description = "";
    }

    if (price == null) {
        price = "";
    }
%>
<form id="form_add" method="POST">
    <table cellspacing="0" border="0">
        <tr>
            <td align="right">Product Code:</td>
            <td><input type="text" name="code" value="<%=code%>"><span style="color: red"><%=codeMessage%></span></td>

        </tr>
        <tr>
            <td align="right">Product Description:</td>
            <td><input type="text" name="description" value="<%=description%>"><span style="color: red"><%=descriptionMessage%></span></td>

        </tr>
        <tr>
            <td align="right">Product Price:</td>
            <td><input type="text" name="price" value="<%=price%>"><span style="color: red"><%=priceMessage%></span></td>
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
