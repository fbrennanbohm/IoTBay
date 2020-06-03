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
 * @author duong
 */
public class EditServlet extends HttpServlet {
     protected void doGet(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       

  HttpSession session = request.getSession();
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  UserDAO userDAO = (UserDAO)session.getAttribute("userDAO");
  User user = null;


    try{
            user=userDAO.findUser(email,password);
            if(user!=null) {
                session.setAttribute("user",user);
                request.getRequestDispatcher("edit.jsp").include(request,response);
            } else {
                session.setAttribute("existErr","User does not exist in the Database");
                request.getRequestDispatcher("edit.jsp").include(request, response);
            }
    }
            
    catch (SQLException ex){
        Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE,null,ex);
        System.out.println(ex.getErrorCode() + " and " + ex.getMessage());
    }
    request.getRequestDispatcher("edit.jsp").include(request, response);
}
     }
       
           