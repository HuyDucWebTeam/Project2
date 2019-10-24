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
        String descriptionMessage = "";
        String priceMessage = "";
        
        if (code.length() == 0) {
            codeMessage = "Please enter product's code.";
            code = " ";
        } else if (ProductIO.isCodeExist(code) && code.equals(oldCode) == false) {
            codeMessage = "Code has existed. Please enter another.";
            code = " ";
        } else {
            request.setAttribute("code", code);
        }

        if (description.length() == 0) {
            descriptionMessage = "Please enter product's description";
            description = " ";
        } else {
            request.setAttribute("description", description);
        }

        float price = 0;
        try {
            price = Float.valueOf(request.getParameter("price"));
        } catch (NumberFormatException e) {
            priceMessage = "Product's price must be a number. Please enter again";
            price = -1;
        }

        if (priceMessage.equals("")) {
            request.setAttribute("price", String.valueOf(price));
        }

        request.setAttribute("codeMessage", codeMessage);
        request.setAttribute("descriptionMessage", descriptionMessage);
        request.setAttribute("priceMessage", priceMessage);

        String url = "/editProductPage.jsp?code=" + code + "&description=" + URLEncoder.encode(description) + "&price=" + price;

        if (codeMessage.equals("") && descriptionMessage.equals("") && priceMessage.equals("")) {
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
