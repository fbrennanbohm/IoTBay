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
public class DeleteController extends HttpServlet {
   

     @Override   

     protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       

  HttpSession session = request.getSession();
  UserDAO userDAO = (UserDAO)session.getAttribute("userDAO");
  int userId = Integer.parseInt(request.getParameter("userId")); 
  
            
         try {
             userDAO.deleteUser(userId);
         } catch (SQLException ex) {
             Logger.getLogger(DeleteController.class.getName()).log(Level.SEVERE, null, ex);
         }
             request.getRequestDispatcher("logout.jsp").include(request, response);
}
     }
          
