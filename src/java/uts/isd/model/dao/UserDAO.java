package uts.isd.model.dao;

import uts.isd.model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/* 
* DBManager is the primary DAO class to interact with the database. 
* Performs CRUD operations with the db.
 */
public class UserDAO {

    private Statement st;

    public UserDAO(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public List<User> listUsers() throws SQLException {
        List<User> userList = new ArrayList<>();
        String query = "SELECT * FROM users ORDER BY userId ASC";
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            int userId = rs.getInt("userId");
            int roleId = rs.getInt("roleId");
            String fName = rs.getString("firstName");
            String lName = rs.getString("lastName");
            String email = rs.getString("email");

            User user = new User(userId, roleId, fName, lName, email);
            userList.add(user);
        }
        rs.close();
        return userList;
    }

    public List<User> searchUsers(String name, String emailInput) throws SQLException {
        List<User> userList = new ArrayList<>();
        String query = "SELECT userId, roleId, firstName, lastName, email"
                + " FROM Users WHERE ";
        if (name.length() > 0) {
            query += "(UPPER(firstName) LIKE '%" + name.toUpperCase() + "%'"
                    + " OR UPPER(lastName) LIKE '%" + name.toUpperCase() + "%')";
        }
        if (emailInput.length() > 0) {
            if (name.length() > 0) {
                query += " AND ";
            }
            query += "UPPER(email) LIKE '%" + emailInput.toUpperCase() + "%'";
        }
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            int userId = rs.getInt("userId");
            int roleId = rs.getInt("roleId");
            String fName = rs.getString("firstName");
            String lName = rs.getString("lastName");
            String email = rs.getString("email");
            User user = new User(userId, roleId, fName, lName, email);
            userList.add(user);
        }
        return userList;
    }

    public User findUser(int id) throws SQLException {
        String query = "SELECT * FROM Users WHERE userid=" + id;
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            int userId = rs.getInt("userId");
            int roleId = rs.getInt("roleId");
            String fName = rs.getString("firstName");
            String lName = rs.getString("lastName");
            String email = rs.getString("email");
            String password = rs.getString("password");

            return new User(userId, roleId, fName, lName, email, password);
        }
        rs.close();
        return null;
    }

    //Find user by email and password in the database   
    public User findUser(String email, String password) throws SQLException {
        //setup the select sql query string       
        //execute this query using the statement field       
        //add the results to a ResultSet       
        //search the ResultSet for a user using the parameters               
        return null;
    }

    //Add a user-data into the database   
    public void addUser(int roleId, String fName, String lName, String email, String password) throws SQLException { //code for add-operation

        String query = "INSERT INTO Users (roleId, firstName, lastName, email, password) VALUES("
                + roleId + ", " + wrapStr(fName) + ", " + wrapStr(lName) + ", "
                + wrapStr(email) + ", " + wrapStr(password) + ")";
        st.executeUpdate(query);

    }

    //update a user details in the database   
    public void updateUser(int userId, int roleId, String fName, String lName, String email, String password) throws SQLException {
        st.executeUpdate("UPDATE Users SET roleId=" + roleId + ", firstName='" + fName + "', lastName='" + lName + "', email='" + email
                + "', password='" + password + "'"
                + " WHERE userId=" + userId);
    }

    //delete a user from the database   
    public void deleteUser(int userId) throws SQLException {
        //code for delete-operation   
        st.executeUpdate("DELETE FROM Users WHERE userID=" + userId + "");
    }

    private String wrapStr(String input) {
        return "'" + input + "'";
    }

}