<%@include file="/includes/header.html" %>

<h1>Product</h1>

<%@page import="business.Product" %>
<%@page import="java.net.URLDecoder" %>
<%@page import="java.nio.charset.StandardCharsets" %>

<%
    String code = null;
    String description = null;
    String price = null;

    String url = request.getQueryString();
    String[] parameters = url.split("&");
    for (int i = 0; i < parameters.length; i++) {
        String[] params = parameters[i].split("=");
        if ("code".equals(params[0])) {
            if (params[1].equals(" ")) {
                code = "";
            } else {
                code = params[1];
            }
        }
        if ("description".equals(params[0])) {
            if (params[1].equals(" ")) {
                description = "";
            } else {
                description = URLDecoder.decode(params[1], StandardCharsets.UTF_8.toString());
            }
        }
        if ("price".equals(params[0])) {
            if (params[1].equals("-1.0")) {
                price = "";
            } else {
                price = params[1];
            }
        }
    }

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
%>
<form id="form_add" method="POST">
    <table cellspacing="0" border="0">
        <tr>
            <td align="right">Product Code:</td>
            <td><input type="text" name="code" value="<%=code%>"><span style="color: red"><%=codeMessage%></span></td>
        <input hidden="1" type="text" name="oldCode" value="<%=code%>">
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
        document.getElementById('form_add').action = 'editProduct';
    }
    function view() {
        document.getElementById('form_add').action = 'viewProduct';
    }
</script>

<%@include file="/includes/footer.jsp" %>
