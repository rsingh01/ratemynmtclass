/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author latta
 */
public class User {
    String email;
    String username;
    String password;
    boolean isAdmin;
    
    User(String newEmail, String newUsername, String newPassword, boolean adminValue) {
        email = newEmail;
        username = newUsername;
        password = newPassword;
        isAdmin = adminValue;
    }
    
    public Boolean isComplete(){
        if (password == null || password.equals("") ||
            email == null || email.equals("") ||
            username == null || username.equals("")) {        
            
            return false;
        } else {
            return true;
        }
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String newEmail) {
        this.email = newEmail;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String newUsername) {
        this.username = newUsername;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String newPassword) {
        this.password = newPassword;
    }
    
    public boolean getAdminVal() {
        return isAdmin;
    }
    
    public void setAdminVal(boolean newVal) {
        this.isAdmin = newVal;
    }
}


