
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
 *
 * @author Patrick
 */
public class AdminDeleteUserController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        int userId = Integer.parseInt(request.getParameter("userId"));
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = new User(userId, roleId, firstName, lastName, email, password);
        UserDAO userDAO = (UserDAO)session.getAttribute("userDAO");
        try {
            if (user != null) {
                userDAO.deleteUser(userId);
                request.setAttribute("successMsg", "User was deleted successfully.");
                request.getRequestDispatcher("adminEditUser.jsp").forward(request, response);
            }
            else {
                request.setAttribute("errorMsg", "User could not be deleted.");
                request.getRequestDispatcher("adminEditUser.jsp?user=" + userId).forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDeleteUserController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("adminEditUser.jsp?user=" + userId).forward(request, response);
    }
}
