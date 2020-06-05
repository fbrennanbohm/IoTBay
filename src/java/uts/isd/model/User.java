package uts.isd.model;

public class User implements java.io.Serializable {

    private int userId;
    private int roleId;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String address;
    private boolean activated;

    public User() {

    }

    public User(int id, int roleId, String firstName, String lastName, String email, String password) {
        this.userId = id;
        this.roleId = roleId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
    }

    public User(int userId, int roleId, String firstName, String lastName, String email, String password, boolean activated) {
        this.userId = userId;
        this.roleId = roleId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.address = address;
        this.activated = activated;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        switch (roleId) {
            case 1:
                return "Customer";
            case 2:
                return "Staff";
            case 3:
                return "System Admin";
            default:
                return "User";
        }
    }

    public boolean isCustomer() {
        return this.roleId == 1;
    }

    public boolean isStaff() {
        return this.roleId == 2;
    }

    public boolean isAdmin() {
        return this.roleId == 3;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isActivated() {
        return activated;
    }

    public void setActivated(boolean activated) {
        this.activated = activated;
    }

}
