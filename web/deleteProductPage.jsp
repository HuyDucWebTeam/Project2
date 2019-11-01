<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/includes/header.html" />

<h1 style="font-weight: bold">Are you sure you want to delete this product?</h1>

<form id="form_delete" method="POST">
    <table cellspaceing="2" border="0">
        <tr>
            <td>Product Code: </td>
            <td>${param.code}</td>
            <input hidden="1" name="code" value="${param.code}">
        </tr>
        <tr>
            <td>Product Description: </td>
            <td>${param.description}</td>
        </tr>
        <tr>
            <td>Product Price: </td>
            <td>${param.price}</td>
        </tr>
        <tr>
            <td><input type="submit" value="Yes" onclick="yes()"></td>
            <td><input type="submit" value="No" onclick="no()"></td>
        </tr>
    </table>
</form>

<script>
    function yes() {
        document.getElementById('form_delete').action = "<c:url value="/deleteProduct"/>";
    }
    function no() {
        document.getElementById('form_delete').action = "<c:url value="/viewProduct"/>";
    }
</script>
<c:import url="/includes/footer.jsp" />
