<%@include file="/includes/header.html"%>

<h1 style="font-weight: bold">Are you sure you want to delete this product?</h1>

<%@page import="java.net.URLDecoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%
    String code = null;
    String description = null;
    String price = null;

    String url = request.getQueryString();
    String[] param = url.split("&");
    for (int i = 0; i < param.length; i++) {
        String[] parameters = param[i].split("=");
        if ("code".equals(parameters[0])) {
            code = parameters[1];
        }
        if ("description".equals(parameters[0])) {
            description = URLDecoder.decode(parameters[1], StandardCharsets.UTF_8.toString());
        }
        if ("price".equals(parameters[0])) {
            price = parameters[1];
        }
    }
%>
<form id="form_delete" method="POST">
    <table cellspaceing="2" border="0">
        <tr>
            <td>Product Code: </td>
            <td><%=code%></td>
            <input hidden="1" name="code" value="<%=code%>">
        </tr>
        <tr>
            <td>Product Description: </td>
            <td><%=description%></td>
        </tr>
        <tr>
            <td>Product Price: </td>
            <td><%=price%></td>
        </tr>
        <tr>
            <td><input type="submit" value="Yes" onclick="yes()"></td>
            <td><input type="submit" value="No" onclick="no()"></td>
        </tr>
    </table>
</form>

<script>
    function yes() {
        document.getElementById('form_delete').action = 'deleteProduct';
    }
    function no() {
        document.getElementById('form_delete').action = 'viewProduct';
    }
</script>
<%@include file="/includes/footer.jsp"%>
