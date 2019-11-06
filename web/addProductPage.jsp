<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="er" uri="/WEB-INF/customTag/errorTag" %>
<c:import url="/includes/header.html"/>

<h1>Product</h1>
<p><er:ifEmptyMark color="red" field=""/> marks required fields</p>

<form id="form_add" method="POST">
    <table cellspacing="0" border="0">
        <tr>
            <td align="right">Product Code:</td>
            <td>
                <input type="text" name="code" value="${code}">
                <er:ifEmptyMark color="red" field="${code}"/>
                <span style="color: red">${requestScope.codeMessage}</span>
            </td>

        </tr>
        <tr>
            <td align="right">Product Description:</td>
            <td>
                <input type="text" name="description" value="${description}">
                <er:ifEmptyMark color="red" field="${description}"/>
            </td>

        </tr>
        <tr>
            <td align="right">Product Price:</td>
            <td>
                <input type="text" name="price" value="${price}">
                <er:ifEmptyMark color="red" field="${price}"/>
                <span style="color: red">${requestScope.priceMessage}</span>
            </td>
        </tr>
    </table>
    <br>
    <br>
    <input type="submit" value="Update Product" onclick="update()">
    <input type="submit" value="View Products" onclick="view()">
</form>

<script>
    function update() {
        document.getElementById('form_add').action = "<c:url value="/addProduct"/>";
    }
    function view() {
        document.getElementById('form_add').action = "<c:url value="/viewProduct"/>";
    }
</script>

<c:import url="/includes/footer.jsp" />
