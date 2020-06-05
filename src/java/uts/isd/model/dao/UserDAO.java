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
            String password = rs.getString("password");
            boolean activated = rs.getBoolean("activated");

            User user = new User(userId, roleId, fName, lName, email, password, activated);
            userList.add(user);
        }
        rs.close();
        return userList;
    }

    public List<User> searchUsers(String name, String emailInput) throws SQLException {
        List<User> userList = new ArrayList<>();
        String query = "SELECT userId, roleId, firstName, lastName, email, password, activated"
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
            String password = rs.getString("password");
            boolean activated = rs.getBoolean("activated");
            User user = new User(userId, roleId, fName, lName, email, password, activated);
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
            boolean activated = rs.getBoolean("activated");

            return new User(userId, roleId, fName, lName, email, password, activated);
        }
        rs.close();
        return null;
    }

    //Find user by email and password in the database
    public User findUser(String email, String password) throws SQLException {
        String fetch = "select * from Users where email ='" + email + "'and password ='" + password + "'";

        //execute this query using the statement field
        //add the results to a ResultSet
        ResultSet rs = st.executeQuery(fetch);
        //search the ResultSet for a user using the parameters
        while (rs.next()) {
            String userEmail = rs.getString("email");
            String userPass = rs.getString("password");
            if (userEmail.equals(email) && userPass.equals(password)) {
                String userFirstName = rs.getString("firstName");
                String userLastName = rs.getString("lastName");
                int userRoleId = rs.getInt("roleId");
                int userId = rs.getInt("userId");
                boolean activated = rs.getBoolean("activated");
                return new User(userId, userRoleId, userFirstName, userLastName, userEmail, userPass, activated);
            }

        }
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

    public void updateUser(int userId, int roleId, String fName, String lName, String email, String password, boolean activate) throws SQLException {
        st.executeUpdate("UPDATE Users SET roleId=" + roleId + ", firstName='" + fName + "', lastName='" + lName + "', email='" + email
                + "', password='" + password + "', activated=" + activate
                + " WHERE userId=" + userId);
    }

    //delete a user from the database
    public void deleteUser(int userId) throws SQLException {
        //code for delete-operation
        st.executeUpdate("DELETE FROM Users WHERE userID=" + userId);
    }

    //update a user's saved shipping details in the database
    public void updateShipping(int userId, String Address) throws SQLException {
        st.executeUpdate("UPDATE Users SET address='" + Address + "'" + " WHERE userId=" + userId);
    }

    private String wrapStr(String input) {
        return "'" + input + "'";
    }

}
