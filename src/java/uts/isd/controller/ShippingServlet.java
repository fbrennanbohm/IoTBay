/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.User;
import uts.isd.model.dao.UserDAO;

/**
 *
 * @author Jack
 */
@WebServlet(name = "ShippingServlet", urlPatterns = {"/ShippingServlet"})
public class ShippingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {   
        
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDAO userDAO = (UserDAO)session.getAttribute("userDAO");
        User user = null;
        
        try {
            user=userDAO.findUser(email,password);
            if(user!=null) {
                session.setAttribute("user",user);
                request.getRequestDispatcher("shipping.jsp").include(request,response);
            } else {
                session.setAttribute("existErr","User does not exist in the Database");
                request.getRequestDispatcher("shipping.jsp").include(request, response);
            }
        }
        
        catch (SQLException ex){
            Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE,null,ex);
            System.out.println(ex.getErrorCode() + " and " + ex.getMessage());
        }
        
        request.getRequestDispatcher("shipping.jsp").include(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
