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
 * This servlet validates the user inputs and updates the specified user record
 * (if validation is successful).
 *
 * @author Patrick
 */
public class AdminUpdateUserController extends HttpServlet {

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
        boolean activate = request.getParameter("activate") != null;

        Validator v = new Validator();
        UserDAO userDAO = (UserDAO) session.getAttribute("userDAO");

        if (v.checkEmpty(firstName, lastName, email, password)) {
            request.setAttribute("errorMsg", "One or more fields are not filled in.");
            request.setAttribute("currentUser", findUser(userId, userDAO));
            request.getRequestDispatcher("adminEditUser.jsp?user=" + userId).forward(request, response);
        } else if (!v.validateName(firstName)) {
            request.setAttribute("errorMsg", "First name must be between 1 to 20 characters in length."
                    + " No numbers or special characters are allowed.");
            request.setAttribute("currentUser", findUser(userId, userDAO));
            request.getRequestDispatcher("adminEditUser.jsp?user=" + userId).forward(request, response);
        } else if (!v.validateName(lastName)) {
            request.setAttribute("errorMsg", "Last name must be between 1 to 20 characters in length."
                    + " No numbers or special characters are allowed.");
            request.setAttribute("currentUser", findUser(userId, userDAO));
            request.getRequestDispatcher("adminEditUser.jsp?user=" + userId).forward(request, response);
        } else if (!v.validateEmail(email) || email.length() > 60) {
            request.setAttribute("errorMsg", "Email format is incorrect.");
            request.setAttribute("currentUser", findUser(userId, userDAO));
            request.getRequestDispatcher("adminEditUser.jsp?user=" + userId).forward(request, response);
        } else if (!v.validatePassword(password)) {
            request.setAttribute("errorMsg", "Password must be between 6 to 20 characters in length.");
            request.setAttribute("currentUser", findUser(userId, userDAO));
            request.getRequestDispatcher("adminEditUser.jsp?user=" + userId).forward(request, response);
        } else {
            try {
                User user = userDAO.findUser(userId);
                if (user != null) {
                    if (userDAO.isEmailUsed(email, userId)) {
                        request.setAttribute("errorMsg", "The email address that you entered is already associated with a user in the system.");
                        request.setAttribute("currentUser", findUser(userId, userDAO));
                        request.getRequestDispatcher("adminEditUser.jsp?user=" + userId).forward(request, response);
                    } else {
                        userDAO.updateUser(userId, roleId, firstName, lastName, email, password, activate);
                        request.setAttribute("successMsg", "Update was successful.");
                        request.setAttribute("currentUser", userDAO.findUser(userId));
                        request.getRequestDispatcher("adminEditUser.jsp?user=" + userId).forward(request, response);
                    }

                } else {
                    request.setAttribute("errorMsg", "Error: User could not be found in the database.");
                    request.getRequestDispatcher("adminEditUser.jsp?user=" + userId).forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(AdminUpdateUserController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("adminEditUser.jsp?user=" + userId).forward(request, response);
        }
    }

    private User findUser(int userId, UserDAO dao) {
        try {
            return dao.findUser(userId);
        } catch (SQLException ex) {
            Logger.getLogger(AdminUpdateUserController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
