package uts.isd.model.dao;

import uts.isd.model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import uts.isd.model.Access;
import uts.isd.model.Payment;
import uts.isd.model.PaymentMethod;

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
            String address = rs.getString("address");

            User user = new User(userId, roleId, fName, lName, email, password, activated, address);
            userList.add(user);
        }
        rs.close();
        return userList;
    }

    public List<User> searchUsers(String name, String emailInput) throws SQLException {
        List<User> userList = new ArrayList<>();
        String query = "SELECT * FROM Users WHERE ";
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
            String address = rs.getString("address");
            User user = new User(userId, roleId, fName, lName, email, password, activated, address);
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
            String address = rs.getString("address");

            return new User(userId, roleId, fName, lName, email, password, activated, address);
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
                String address = rs.getString("address");
                return new User(userId, userRoleId, userFirstName, userLastName, userEmail, userPass, activated, address);
            }

        }
        return null;
    }

    // Checks if the email is already being used by an existing user in the database
    // Ignores user records with the provided userId (if userId >= 0)
    public boolean isEmailUsed(String emailInput, int userId) throws SQLException {
        String query = "SELECT * FROM Users WHERE email='" + emailInput + "'";
        if (userId >= 0) {
            query += " AND userId <> " + userId;
        }
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            String email = rs.getString("email");
            if (email.equals(emailInput)) {
                return true;
            }
        }
        return false;
    }

    //Add a user-data into the database
    public void addUser(int roleId, String fName, String lName, String email, String password) throws SQLException { //code for add-operation

        String query = "INSERT INTO Users (roleId, firstName, lastName, email, password) VALUES("
                + roleId + ", '" + fName + "', '" + lName + "', '" + email + "', '" + password + "')";
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

    //delete a user's saved shipping details in the database
    public void deleteAddress(int userId) throws SQLException {
        //code for delete-operation
        st.executeUpdate("UPDATE Users SET address=NULL WHERE userId=" + userId);
    }

    //find access history
    public Access findAccess(String logIn) throws SQLException {
        String fetch = "select * from access_log where log_in ='" + logIn + "'";

        //execute this query using the statement field
        //add the results to a ResultSet
        ResultSet rs = st.executeQuery(fetch);
        //search the ResultSet for a user using the parameters
        while (rs.next()) {

            String userLogIn = rs.getString("log_in");
            if (userLogIn.equals(logIn)) {
                String email = rs.getString("email");
                return new Access(email, userLogIn);
            }

        }
        return null;
    }

    //Add access record
    public void addAccess(String email, String log_in_date) throws SQLException {
        st.executeUpdate("insert into access_Log(email,log_in)  " + "values('" + email + "','" + log_in_date + "')");
    }

    //fetch access record
    public ArrayList<Access> fetchAccess(String email) throws SQLException {

        String fetch = "select * from access_log where email='" + email + "'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Access> temp = new ArrayList<Access>();
        while (rs.next()) {

            String logIn = rs.getString("log_in");
            temp.add(new Access(email, logIn));
        }
        rs.close();
        return temp;

    }

    //update a user's saved shipping details in the database
    public void updateShipping(int userId, String Address) throws SQLException {
        st.executeUpdate("UPDATE Users SET address='" + Address + "'" + " WHERE userId=" + userId);
    }

    public void addPayment(int userId, String type, String cardNumber, String name, String valid, String cvc) throws SQLException { //code for add-operation
        String query = "INSERT INTO PAYMENTMETHOD (UserId, Type, CardNumber, Name, ValidUNTIL, CVC) VALUES("
                + userId + ", " + wrapStr(type) + ", " + wrapStr(cardNumber) + ", "
                + wrapStr(name) + ", " + wrapStr(valid) + ", " + wrapStr(cvc) + ")";
        st.executeUpdate(query);

    }

    public void deletePayment(int removeId) throws SQLException {
        //code for delete-operation
        st.executeUpdate("DELETE FROM PaymentMethod WHERE PAYMENTMETHODID=" + removeId);
    }
    
    public void updatePayment(int paymentId, String paymentType, String cardNumber, String cardHolder, String cvc) throws SQLException {
        st.executeUpdate("UPDATE PaymentMethod SET TYPE='" + paymentType + "'" + ", CARDNUMBER ='" + cardNumber + "'" + ", NAME='" + cardHolder + "'" + ", CVC = '" + cvc +"' WHERE paymentMethodId=" + paymentId);
    }

    public List<Payment> searchPayment(int paymentID, String date) throws SQLException {
        List<Payment> paymentList = new ArrayList<>();
        String query = "SELECT * FROM Payment WHERE paymentID= '" + paymentID + "'";;

        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            int paymentId = rs.getInt("PaymentID");
            int orderId = rs.getInt("OrderID");
            int paymentMethodId = rs.getInt("PaymentMethodID");
            double paidAmount = rs.getDouble("paidAmount");
            String detail = rs.getString("detail");

            Payment payment = new Payment(paymentMethodId, orderId, paymentId, orderId, paidAmount, detail);
            paymentList.add(payment);
        }
        return paymentList;
    }

    public PaymentMethod findPayment(int paymentId) throws SQLException {
        String query = "SELECT * FROM \"PAYMENTMETHOD\" WHERE PAYMENTMETHODID=" + paymentId;
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            int paymentMethodID = rs.getInt("PaymentMethodID");
            int userID = rs.getInt("UserId");
            String cardNumber = rs.getString("CardNumber");
            String cvc = rs.getString("CVC");
            String type = rs.getString("Type");
            String name = rs.getString("Name");
            String expiryDate = rs.getString("VALIDUNTIL");
            return new PaymentMethod(paymentMethodID, userID, type, cardNumber, name, expiryDate, cvc);
        }
        rs.close();
        return null;
    }

    private String wrapStr(String input) {
        return "'" + input + "'";
    }

}
