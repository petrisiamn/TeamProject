package model;

import java.sql.Date;

/**
 *
 * @author Adiputra Setiawan
 */
public class UserModel {
    private String username;
    private String email;
    private Date regdate;

    public UserModel() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    @Override
    public String toString() {
        return "UserModel{" + "username=" + username + ", email=" + email + ", regdate=" + regdate + '}';
    }

    
    
}
//