package shop;

import business.Product;
import data.ProductIO;
import static data.ProductIO.productList;
import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;

public class viewProduct extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        ServletContext sc = getServletContext();
        String file = sc.getRealPath(sc.getInitParameter("relativePathToFile"));
        ProductIO.viewProduct(file);
        
        request.setAttribute("productList", productList);
        String url = "/viewProducts.jsp";
        RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
