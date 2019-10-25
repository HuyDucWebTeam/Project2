package shop;

import data.ProductIO;
import static data.ProductIO.productList;
import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.*;

public class viewProduct extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        ServletContext sc = getServletContext();
        String file = sc.getRealPath(sc.getInitParameter("relativePathToFile"));
        ProductIO.viewProduct(file);
        
        HttpSession session = request.getSession();
        session.setAttribute("productList", productList);
        
        String url = "/viewProductPage.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        doGet(request, response);
    }
}
