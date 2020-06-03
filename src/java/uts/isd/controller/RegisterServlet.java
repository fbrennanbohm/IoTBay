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

public class RegisterServlet extends HttpServlet {
   

     @Override   

     protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       

  HttpSession session = request.getSession();
  Validator validator = new Validator();
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  String fname = request.getParameter("firstName");
  String lname = request.getParameter("lastName");
  UserDAO userDAO = (UserDAO)session.getAttribute("userDAO"); 
  int roleId= Integer.parseInt(request.getParameter("roleId"));
  validator.clear(session);

 
  if(!validator.validateName(fname)) {
    session.setAttribute("nameErr","Error: Name format incorrect");
    request.getRequestDispatcher("register.jsp").include(request,response);
}   else if (!validator.validateName(lname)) {
    session.setAttribute("nameErr","Error: Name format incorrect");
    request.getRequestDispatcher("register.jsp").include(request,response);
}  else if (!validator.validateEmail(email)) {
    session.setAttribute("emailErr","Error: Email format incorrect");
    request.getRequestDispatcher("register.jsp").include(request,response);
} else if (!validator.validatePassword(password)) {
    session.setAttribute("passErr","Error: Password format incorrect");
    request.getRequestDispatcher("register.jsp").include(request,response);
}
else{
    try{
           User exist = userDAO.findUser(email,password);
            if(exist!=null) {
                session.setAttribute("existErr","user already exists");
                request.getRequestDispatcher("register.jsp").include(request,response);
            } else {
                
               userDAO.addUser(roleId,fname,lname,email,password);                
                User user = userDAO.findUser(email,password);
                session.setAttribute("user",user);
                request.getRequestDispatcher("welcome.jsp").include(request, response);
            }
            }
    catch (SQLException ex){
         Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE,null,ex);
    }
}
     }
}           
           
  

                     
