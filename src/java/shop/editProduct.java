package shop;

import business.Product;
import data.ProductIO;
import java.io.IOException;
import java.net.URLEncoder;
import javax.servlet.http.*;
import javax.servlet.*;

public class editProduct extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String oldCode = request.getParameter("oldCode");

        String code = request.getParameter("code");
        String description = request.getParameter("description");

        String codeMessage = "";
        String priceMessage = "";

        if (ProductIO.isCodeExist(code) && code.equals(oldCode) == false) {
            codeMessage = "* Code has existed. Please enter another.";
            code = "";
        }

        float price = 0;
        String priceURL = "";
        if (request.getParameter("price").length() != 0) {
            try {
                price = Float.valueOf(request.getParameter("price"));
                priceURL = String.valueOf(price);
            } catch (NumberFormatException e) {
                priceMessage = "Product's price must be a number. Please enter again";
                priceURL = "";
            }
        }

        request.setAttribute("codeMessage", codeMessage);
        request.setAttribute("priceMessage", priceMessage);

        String url = "/editProductPage.jsp?code=" + oldCode + "&description=" + URLEncoder.encode(description) + "&price=" + priceURL;

        if (code.length() != 0 && codeMessage.equals("") && description.length() != 0 && priceURL.length() != 0 && priceMessage.equals("")) {
            Product product = new Product(code, description, price);
            ServletContext sc = getServletContext();
            String file = sc.getRealPath(sc.getInitParameter("relativePathToFile"));
            ProductIO.editProduct(oldCode, product, file);
            url = "/viewProductPage.jsp";
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
