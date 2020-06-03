/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
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
public class UserSearchController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");    
        HttpSession session = request.getSession();
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
    
        UserDAO userDAO = (UserDAO)session.getAttribute("userDAO");
        try {
            List<User> userList = userDAO.searchUsers(name, email);
            request.setAttribute("userList", userList);
            request.setAttribute("name", name);
            request.setAttribute("email", email);
        }
        catch (SQLException ex) {
            Logger.getLogger(UserListController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("userSearch.jsp").forward(request, response);
    }
}
