package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Product;
import uts.isd.model.dao.ProductDAO;

/**
 *
 * @author felix
 */
public class UpdateProductController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        Integer productId = Integer.parseInt(request.getParameter("productId"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Integer stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
        Float price = Float.parseFloat(request.getParameter("price"));
        String imageUrl = request.getParameter("imageUrl");

        Product product = new Product(productId, name, description, stockQuantity, price, imageUrl);

        ProductDAO productDAO = (ProductDAO) session.getAttribute("productDAO");
        try {
            productDAO.update(product);
            request.setAttribute("currentProduct", product);
        } catch (SQLException ex) {
            String x = ex.getLocalizedMessage();
            Logger.getLogger(UserListController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMsg", "An error occurred.");
        }
        request.getRequestDispatcher("editProduct.jsp").forward(request, response);
    }
}
