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
import uts.isd.model.User;
import uts.isd.model.dao.ProductDAO;

/**
 *
 * @author felix
 */
public class EditProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        int id = Integer.parseInt(request.getParameter("id")); // get id from HTTP request parameter
        ProductDAO productDAO = (ProductDAO) session.getAttribute("productDAO");
        try {
            Product product = productDAO.find(id);
            if (product != null) {
                request.setAttribute("currentProduct", product);
                request.getRequestDispatcher("editProduct.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMsg", "Product does not exist in the database.");
                request.getRequestDispatcher("editProduct.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserListController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("editProduct.jsp").forward(request, response);
    }
}
