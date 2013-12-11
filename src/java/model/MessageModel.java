/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

import java.sql.Date;

/**
 *
 * @author Adiputra Setiawan
 */
public class MessageModel {
    private String idconversation;
    private String uname_from, uname_to;
    private String msg;
    private Date datetime;

    public String getIdconversation() {
        return idconversation;
    }

    public void setIdconversation(String idconversation) {
        this.idconversation = idconversation;
    }
    
    public String getUname_from() {
        return uname_from;
    }

    public void setUname_from(String uname_from) {
        this.uname_from = uname_from;
    }

    public String getUname_to() {
        return uname_to;
    }

    public void setUname_to(String uname_to) {
        this.uname_to = uname_to;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    
    
    
            
}
