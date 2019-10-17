<%@page import="java.util.*" %>
<%
    GregorianCalendar currentDate = new GregorianCalendar();
    int currentYear = currentDate.get(Calendar.YEAR);
%>

<p>
    <small>
        &copy; Copyright <%= currentYear%>
        Le Quoc Huy &amp; Nguyen Manh Duc.
        All rights reserved.
    </small>
</p>
</body>
</html>