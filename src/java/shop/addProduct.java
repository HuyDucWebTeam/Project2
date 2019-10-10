package shop;

import business.Product;
import data.ProductIO;
import static data.ProductIO.productList;
import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;

public class addProduct extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String code = request.getParameter("code");
        String desription = request.getParameter("description");
        float price = Float.valueOf(request.getParameter("price"));
        
        Product product = new Product(code, desription, price);
        ServletContext sc = getServletContext();
        String file = sc.getRealPath(sc.getInitParameter("relativePathToFile"));
        ProductIO.addProduct(product, file);
        
        String url = "/viewProducts.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}

