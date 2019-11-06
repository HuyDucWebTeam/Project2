package shop;

import business.Product;
import data.ProductIO;
import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.*;

public class addProduct extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String code = request.getParameter("code");
        String description = request.getParameter("description");

        String codeMessage = "";
        String priceMessage = "";

        if (ProductIO.isCodeExist(code)) {
            codeMessage = "Code has existed. Please enter another code.";
        } else {
            request.setAttribute("code", code);
        }

        if (description.length() != 0) {
            request.setAttribute("description", description);
        }

        float price = 0;
        if (request.getParameter("price").length() != 0) {
            try {
                price = Float.valueOf(request.getParameter("price"));
            } catch (NumberFormatException e) {
                priceMessage = "Product's price must be a number. Please enter again";
            }
            if (priceMessage.equals("")) {
                request.setAttribute("price", String.valueOf(price));
            } else {
                request.setAttribute("price", "");
            }
        } else {
            request.setAttribute("price", "");
        }

        request.setAttribute("codeMessage", codeMessage);
        request.setAttribute("priceMessage", priceMessage);

        String url = "/addProductPage.jsp";

        if (code.length() != 0 && codeMessage.equals("") && description.length() != 0 && request.getParameter("price").length() != 0 && priceMessage.equals("")) {
            Product product = new Product(code, description, price);
            ServletContext sc = getServletContext();
            String file = sc.getRealPath(sc.getInitParameter("relativePathToFile"));
            ProductIO.addProduct(product, file);
            url = "/viewProductPage.jsp";
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
