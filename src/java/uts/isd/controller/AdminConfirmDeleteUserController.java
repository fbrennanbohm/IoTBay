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
public class AdminConfirmDeleteUserController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        int userId = Integer.parseInt(request.getParameter("id"));
        
        UserDAO userDAO = (UserDAO)session.getAttribute("userDAO");
        
        User user = null;
        try {
            user = userDAO.findUser(userId);
            if (user != null) {
                request.setAttribute("currentUser", user);
                request.getRequestDispatcher("adminDeleteUser.jsp").forward(request, response);
            }
            else {
                request.setAttribute("userError", "User does not exist in the database.");
                request.getRequestDispatcher("adminDeleteUser.jsp").forward(request, response);
            }
        }
        catch (SQLException ex) {
            Logger.getLogger(UserListController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("adminDeleteUser.jsp").forward(request, response);
    }
}
