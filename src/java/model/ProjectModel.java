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
public class ProjectModel {
    private int projectid;
    private String projectname;
    private String desc;
    private Date start_date;
    private Date finish_date;
    private String status;

    public ProjectModel() {
    }

    public int getProjectid() {
        return projectid;
    }

    public void setProjectid(int projectid) {
        this.projectid = projectid;
    }

    public String getProjectname() {
        return projectname;
    }

    public void setProjectname(String projectname) {
        this.projectname = projectname;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getFinish_date() {
        return finish_date;
    }

    public void setFinish_date(Date finish_date) {
        this.finish_date = finish_date;
    }

    @Override
    public String toString() {
        return "ProjectModel{" + "projectid=" + projectid + ", projectname=" + projectname + ", desc=" + desc + ", start_date=" + start_date + ", finish_date=" + finish_date + ", status=" + status + '}';
    }

    
    
    
}
