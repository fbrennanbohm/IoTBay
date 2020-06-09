
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
import uts.isd.model.User;
import uts.isd.model.dao.UserDAO;

/**
 * This servlet deletes the selected user from the database.
 * @author Patrick
 */
public class DeleteController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        UserDAO userDAO = (UserDAO)session.getAttribute("userDAO");
         int userId = Integer.parseInt(request.getParameter("id"));        
        
        try {            
                userDAO.deleteUser(userId);                
                request.getRequestDispatcher("logout.jsp").forward(request, response);
           
        } catch (SQLException ex) {
            Logger.getLogger(AdminDeleteUserController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("logout.jsp").forward(request, response);
    }
}
