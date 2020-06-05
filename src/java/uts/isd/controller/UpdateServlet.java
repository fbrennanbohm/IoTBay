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
public class UpdateServlet extends HttpServlet {
     @Override   
     protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       

    HttpSession session = request.getSession();
    String firstName = request.getParameter("firstName");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    UserDAO userDAO = (UserDAO)session.getAttribute("userDAO");
    String lastName = request.getParameter("lastName");
    int userId = Integer.parseInt(request.getParameter("Id"));
    int roleId= 1;

    User user = new User(userId,roleId,firstName,lastName,email,password);
  
    try{
       
        if(user != null) {
            session.setAttribute("user", user);
            userDAO.updateUser(userId,roleId,firstName,lastName,email,password);
            session.setAttribute("updated","Update was successful");
            request.getRequestDispatcher("edit.jsp").include(request,response);
        }
        else {
                session.setAttribute("updated","Update was not successful");
                request.getRequestDispatcher("edit.jsp").include(request,response);
                }
        }
            
            
    catch (SQLException | NullPointerException ex){
       Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE,null,ex);
    }
    response.sendRedirect("edit.jsp");
}
     }
          
