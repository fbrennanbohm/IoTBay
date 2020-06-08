package uts.isd.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Product;
import uts.isd.model.dao.CartDAO;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.ProductDAO;




/**
 *
 * @author Jack
 */
public class AddCartServlet extends HttpServlet {
    
    private CartDAO cartDAO;
    
    @Override //Create and instance of DBConnector for the deployment session
    public void init() {
        try {
            DBConnector db = new DBConnector();
            Connection conn = db.openConnection();
            cartDAO = new CartDAO(conn);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        response.setContentType("text/html;charset=UTF-8");
        System.out.println(request.getParameter("id"));
        int userId = Integer.parseInt(request.getParameter("id"));
        int productId = Integer.parseInt(request.getParameter("product"));
        HttpSession session = request.getSession();
        ProductDAO productDAO = (ProductDAO) session.getAttribute("productDAO");
        
        try {
            cartDAO.addCartItem(userId, productId);
            List<Integer> userCart = cartDAO.getCart(userId);
            request.setAttribute("userCart", userCart);
           
        } catch (SQLException ex){
            Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE,null,ex);
            System.out.println(ex.getErrorCode() + " and " + ex.getMessage());
        }
        
        
        
        request.getRequestDispatcher("added.jsp").include(request,response);
    
    //check for active order
    //if no active order, create new
    //grab current list, add into list
    }
}
