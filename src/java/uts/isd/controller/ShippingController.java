/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

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
     import java.io.IOException;

/**
 *
 * @author Jack
 */
public class ShippingController extends HttpServlet {
     @Override   
     protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       

    HttpSession session = request.getSession();
    UserDAO userDAO = (UserDAO)session.getAttribute("userDAO");
    String address = request.getParameter("address");
    int userId = Integer.parseInt(request.getParameter("id"));
    
    
    
    try{
        User user = userDAO.findUser(userId);
        user.setAddress(address);
        if(user != null) {
            session.setAttribute("user", user);
            userDAO.updateShipping(userId, address);
            session.setAttribute("updated","Update was successful");
            request.getRequestDispatcher("shipping.jsp").include(request,response);
        }
        else {
                session.setAttribute("updated","Update was not successful");
                request.getRequestDispatcher("shipping.jsp").include(request,response);
                }
        }
            
            
    catch (SQLException | NullPointerException ex){
       Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE,null,ex);
    }
    response.sendRedirect("shipping.jsp");
}
}
