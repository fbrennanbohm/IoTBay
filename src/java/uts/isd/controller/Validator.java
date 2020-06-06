package uts.isd.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

public class Validator implements Serializable {

    private String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)";
     private String namePattern = "([A-Z][a-zA-z]{1,20})";
    private String passwordPattern = "[a-z0-9]{6,20}";
    
    private String paymentPattern = "([A-Z][a-zA-z]{4,15})";
    private String cardNumberPattern = "[0-9]{15,16}";
    private String cardHolderPattern = "([A-Z][a-zA-z]{1,35})";
    private String expiryDatePattern = "(0[1-9]|1[0-2])[-][0-9]{2}";
    private String cvcPattern = "[0-9]{3}";
 
    public Validator() {
    }

    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);

        return match.matches();
    }

    public boolean checkEmpty(String email, String password) {
        return email.isEmpty() || password.isEmpty();
    }
    
    
    public boolean checkEmpty(String firstName, String lastName, String email, String password) {
        return firstName.isEmpty() || lastName.isEmpty() || email.isEmpty() || password.isEmpty();
    }

    public boolean validateEmail(String email) {
        return validate(emailPattern, email);
    }

    public boolean validateName(String name) {
        return validate(namePattern, name);
    }

    public boolean validatePassword(String password) {
        return validate(passwordPattern, password);
    }
    
    public boolean validatePaymentType(String paymentType) {
        return validate(paymentPattern, paymentType);
    }
    
    public boolean validateCardNumber(String cardNumber) {
        return validate(cardNumberPattern, cardNumber);
    }
    
    public boolean validateCardHolder(String cardHolder) {
        return validate(cardHolderPattern, cardHolder);
    }
    
    public boolean validateExpiryDate(String expiryDate) {
        return validate(expiryDatePattern, expiryDate);
    }
    
    public boolean validateCvc(String cvc) {
        return validate(cvcPattern, cvc);
    }
    

    public void clear (HttpSession session) {
    session.setAttribute("emailErr","Enter email");
    session.setAttribute("passErr","Enter password");
    session.setAttribute("existErr","");
    session.setAttribute("nameErr","Enter name");
}
}
