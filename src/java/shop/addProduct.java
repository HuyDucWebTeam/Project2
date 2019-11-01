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

        String message = "";
        String codeMessage = "";
        String descriptionMessage = "";
        String priceMessage = "";

        if (code.length() == 0) {
            codeMessage = "*";
            message = "You must enter all required fields.";
        } else if (ProductIO.isCodeExist(code)) {
            codeMessage = "* Code has existed. Please enter another.";
        } else {
            request.setAttribute("code", code);
        }

        if (description.length() == 0) {
            descriptionMessage = "*";
            message = "You must enter all required fields.";
        } else {
            request.setAttribute("description", description);
        }

        float price = 0;
        try {
            price = Float.valueOf(request.getParameter("price"));
        } catch (NumberFormatException e) {
            priceMessage = "* Product's price must be a number. Please enter again";
            message = "You must enter all required fields.";
        }

        if (priceMessage.equals("")) {
            request.setAttribute("price", String.valueOf(price));
        }

        request.setAttribute("message", message);
        request.setAttribute("codeMessage", codeMessage);
        request.setAttribute("descriptionMessage", descriptionMessage);
        request.setAttribute("priceMessage", priceMessage);

        String url = "/addProductPage.jsp";

        if (codeMessage.equals("") && descriptionMessage.equals("") && priceMessage.equals("")) {
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
