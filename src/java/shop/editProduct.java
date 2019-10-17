package shop;

import business.Product;
import data.ProductIO;
import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.*;

public class editProduct extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String oldCode = request.getParameter("oldCode");
        String code = request.getParameter("code");
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        
        Product product = new Product(code, description, price);
        ServletContext sc = getServletContext();
        String file = sc.getRealPath(sc.getInitParameter("relativePathToFile"));
        
        ProductIO.editProduct(oldCode, product, file);
        
        String url = "/viewProductPage.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}

