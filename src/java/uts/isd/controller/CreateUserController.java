/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class CreateUserController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        //int userId = Integer.parseInt(request.getParameter("userId"));
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        Validator v = new Validator();
        if (v.checkEmpty(firstName, lastName, email, password)) {
            request.setAttribute("errorMsg", "One or more fields are not filled in.");
            request.getRequestDispatcher("newUser.jsp").forward(request, response);
        }
        else if (!v.validateName(firstName)) {
            request.setAttribute("errorMsg", "First name must be between 1 to 20 characters in length."
                    + " No numbers or special characters are allowed.");
            request.getRequestDispatcher("newUser.jsp").forward(request, response);
        }
        else if (!v.validateName(lastName)) {
            request.setAttribute("errorMsg", "Last name must be between 1 to 20 characters in length."
                    + " No numbers or special characters are allowed.");
            request.getRequestDispatcher("newUser.jsp").forward(request, response);
        }
        else if (!v.validateEmail(email) || email.length() > 60) {
            request.setAttribute("errorMsg", "Email format is incorrect.");
            request.getRequestDispatcher("newUser.jsp").forward(request, response);
        }
        else if (!v.validatePassword(password)) {
            request.setAttribute("errorMsg", "Password must be between 6 to 20 characters in length.");
            request.getRequestDispatcher("newUser.jsp").forward(request, response);
        }
        else {
            User user = new User(roleId, firstName, lastName, email, password);
            UserDAO userDAO = (UserDAO)session.getAttribute("userDAO");
            try {
                if (user != null) {
                    userDAO.addUser(roleId, firstName, lastName, email, password);
                    request.setAttribute("successMsg", "User was successfully created.");
                    request.setAttribute("currentUser", user);
                    request.getRequestDispatcher("newUser.jsp").forward(request, response);
                }
                else {
                    request.setAttribute("errorMsg", "User could NOT be created.");
                    request.getRequestDispatcher("newUser.jsp").forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(CreateUserController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.getRequestDispatcher("newUser.jsp").forward(request, response);
        }
    }
}
