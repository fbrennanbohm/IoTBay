package uts.isd.controller;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;

import java.util.logging.Level;

import java.util.logging.Logger;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;
import uts.isd.model.Access;

import uts.isd.model.User;

import uts.isd.model.dao.UserDAO;

/**
 *
 * @author duong
 */
public class AccessSearch extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String logIn = request.getParameter("logIn");
        UserDAO userDAO = (UserDAO) session.getAttribute("userDAO");

        try {

            Access accessSearch = userDAO.findAccess(logIn);
            session.setAttribute("accessSearch", accessSearch);
            request.getRequestDispatcher("AccessLog.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AccessSearch.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("AccessLog.jsp");
    }
}
