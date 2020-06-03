/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;


     import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
public class LoginServlet extends HttpServlet {
   

     @Override   

     protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       

  HttpSession session = request.getSession();
  Validator validator = new Validator();
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  UserDAO userDAO = (UserDAO)session.getAttribute("userDAO");
  validator.clear(session);
  DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
  LocalDateTime now = LocalDateTime.now();
  String logIn = dtf.format(now);
 
  
if(!validator.validateEmail(email)) {
    session.setAttribute("emailErr","Error: Email format incorrect");
    request.getRequestDispatcher("login.jsp").include(request,response);
}   else if (!validator.validatePassword(password)) {
    session.setAttribute("passErr","Error: Password format incorrect");
    request.getRequestDispatcher("login.jsp").include(request,response);
} else{
    try{
            User user=userDAO.findUser(email,password);
            if(user!=null) {      
                userDAO.addAcess(email,logIn);
                session.setAttribute("user",user);
                request.getRequestDispatcher("welcome.jsp").include(request,response);
                
            } else {
                session.setAttribute("existErr","User does not exist in the Database");
                request.getRequestDispatcher("login.jsp").include(request, response);
            }
            }
    catch (SQLException | NullPointerException ex){
        System.out.println(ex.getMessage() == null ?"User does not exist":"Welcome");
    }
}
     }
}           
           
  

                     