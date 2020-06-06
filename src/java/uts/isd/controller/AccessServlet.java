package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
 * This servlet displays fetches the user list from the database
 * and forwards it to the userList JSP page.
 * 
 * @author Patrick
 */

public class AccessServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();          
        User user = (User)session.getAttribute("user");
        String email = user.getEmail();
        String password = user.getPassword();
        UserDAO userDAO = (UserDAO)session.getAttribute("userDAO");
        try {
            user = userDAO.findUser(email,password);
            ArrayList<Access> access = userDAO.fetchAccess(email);
            session.setAttribute("access", access);
            session.setAttribute("user",user);
        }
        catch (SQLException ex) {
            Logger.getLogger(AccessServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("AccessLog.jsp").forward(request, response);
    }
}
