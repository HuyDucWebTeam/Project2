package shop;

import business.Product;
import data.ProductIO;
import static data.ProductIO.productList;
import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;

public class deleteProduct extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String url = "/deleteProduct.jsp";
        RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}

