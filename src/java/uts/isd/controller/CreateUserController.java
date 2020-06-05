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
import uts.isd.model.dao.UserDAO;

/**
 * This servlet calls the Validator class to perform data validation on the user inputs.
 * If all the inputs are valid, the servlet creates a new record for the user in the database.
 * 
 * @author Patrick
 */
public class CreateUserController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Validator v = new Validator();
        if (v.checkEmpty(firstName, lastName, email, password)) {
            request.setAttribute("errorMsg", "One or more fields are not filled in.");
            request.getRequestDispatcher("newUser.jsp").forward(request, response);
        } else if (!v.validateName(firstName)) {
            request.setAttribute("errorMsg", "First name must be between 1 to 20 characters in length."
                    + " No numbers or special characters are allowed.");
            request.getRequestDispatcher("newUser.jsp").forward(request, response);
        } else if (!v.validateName(lastName)) {
            request.setAttribute("errorMsg", "Last name must be between 1 to 20 characters in length."
                    + " No numbers or special characters are allowed.");
            request.getRequestDispatcher("newUser.jsp").forward(request, response);
        } else if (!v.validateEmail(email) || email.length() > 60) {
            request.setAttribute("errorMsg", "Email format is incorrect.");
            request.getRequestDispatcher("newUser.jsp").forward(request, response);
        } else if (!v.validatePassword(password)) {
            request.setAttribute("errorMsg", "Password must be between 6 to 20 characters in length.");
            request.getRequestDispatcher("newUser.jsp").forward(request, response);
        } else {
            UserDAO userDAO = (UserDAO) session.getAttribute("userDAO");
            try {
                userDAO.addUser(roleId, firstName, lastName, email, password);
                request.setAttribute("successMsg", "User was successfully created.");
                request.getRequestDispatcher("newUser.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(CreateUserController.class.getName()).log(Level.SEVERE, null, ex);
            }
        request.getRequestDispatcher("newUser.jsp").forward(request, response);
        }
    }
}
