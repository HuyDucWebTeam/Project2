<%@page import="java.util.*" %>
<%
    GregorianCalendar currentDate = new GregorianCalendar();
    int currentYear = currentDate.get(Calendar.YEAR);
%>

<p>
    <small>
        &copy; Copyright <%= currentYear%>
        Mike Murach &amp; Associates, Inc.
        All rights reserved
    </small>
</p>
</body>
</html>