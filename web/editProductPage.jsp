<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/includes/header.html" />
<h1>Product</h1>

<form id="form_add" method="POST">
    <table cellspacing="0" border="0">
        <tr>
            <td align="right">Product Code:</td>
            <td><input type="text" name="code" value="${param.code}"><span style="color: red">${codeMessage}</span></td>
        <input hidden="1" type="text" name="oldCode" value="${param.code}">
        </tr>
        <tr>
            <td align="right">Product Description:</td>
            <td><input type="text" name="description" value="${param.description}"><span style="color: red">${descriptionMessage}</span></td>
        </tr>
        <tr>
            <td align="right">Product Price:</td>
            <td><input type="text" name="price" value="${param.price}"><span style="color: red">${priceMessage}</span></td>
        </tr>
    </table>
    <br>
    <br>
    <input type="submit" value="Update Product" onclick="update()">
    <input type="submit" value="View Products" onclick="view()">
</form>

<script>
    function update() {
        document.getElementById('form_add').action = "<c:url value="/editProduct"/>";
    }
    function view() {
        document.getElementById('form_add').action = "<c:url value="/viewProduct"/>";
    }
</script>

<c:import url="/includes/footer.jsp" />
