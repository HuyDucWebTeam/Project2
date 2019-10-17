package shop;

import data.ProductIO;
import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.*;

public class deleteProduct extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String code = request.getParameter("code");
        
        ServletContext sc = getServletContext();
        String file = sc.getRealPath(sc.getInitParameter("relativePathToFile"));
        ProductIO.deleteProduct(code, file);
        
        String url = "/viewProductPage.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}

