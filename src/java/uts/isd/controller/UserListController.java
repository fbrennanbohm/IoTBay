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

public class UserListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");    
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //2- create an instance of the Validator class    
        //3- capture the posted email      
        //4- capture the posted password    
        //5- retrieve the manager instance from session      
        UserDAO userDAO = (UserDAO)session.getAttribute("userDAO");
        try {
            List<User> userList = userDAO.listUsers();
            request.setAttribute("userList", userList);
            
        }
        catch (SQLException ex) {
            Logger.getLogger(UserListController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("userList.jsp").forward(request, response);
    }
}
