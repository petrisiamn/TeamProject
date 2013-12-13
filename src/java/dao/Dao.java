package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import jdbc.MySQLDriver;
import model.MessageModel;
import model.ProjectMemberModel;
import model.ProjectModel;
import model.UserModel;

/**
 *
 * @author Adiputra Setiawan
 */
public class Dao {

    private final MySQLDriver con;
    private ResultSet rs = null;

    public Dao() {
        this.con = new MySQLDriver();
    }

    // <editor-fold defaultstate="collapsed" desc="DAO ProjectModel">
    public boolean createProject(ProjectModel project,String username){
        con.runQuery("INSERT INTO `project`(`id_project`, `name`, `desc`, `start_date`, `finish_date`) VALUES (NULL,'"+project.getProjectname()+"','"+project.getDesc()+"','"+project.getStart_date()+"','"+project.getFinish_date()+"')");
        return con.runQuery("INSERT INTO `projectmember`(`id_project`, `username`, `role`) VALUES (LAST_INSERT_ID(),'" + username + "','project manager')");
    }
    public ArrayList<ProjectModel> getAllProject(String username) {
        ArrayList<ProjectModel> projects = new ArrayList<>();
        try {
            //con = new MySQLDriver();
            rs = con.getData("SELECT * FROM `projectmember` JOIN `project` USING (`id_project`) WHERE `username`='" + username + "'");

            while (rs.next()) {
                ProjectModel project = new ProjectModel();
                project.setProjectid(rs.getInt("id_project"));
                project.setProjectname(rs.getString("name"));
                project.setDesc(rs.getString("desc"));
                project.setStart_date(rs.getDate("start_date"));
                project.setFinish_date(rs.getDate("finish_date"));
                project.setStatus(rs.getString("status"));
                projects.add(project);
            }
            con.disconnect();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projects;
    }
    public ProjectModel getDataProject(int projectid){
        ProjectModel project = new ProjectModel();
        try {
            rs = con.getData("SELECT * FROM `project` WHERE `id_project`=" + projectid);

            if (rs.next()) {
                project.setProjectid(rs.getInt("id_project"));
                project.setProjectname(rs.getString("name"));
                project.setDesc(rs.getString("desc"));
                project.setStart_date(rs.getDate("start_date"));
                project.setFinish_date(rs.getDate("finish_date"));
                project.setStatus(rs.getString("status"));
            }
            con.disconnect();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return project;
    }
    // </editor-fold>
    // <editor-fold defaultstate="collapsed" desc="DAO UserModel">
    public ArrayList<UserModel> getMemberProject() {
        ArrayList<UserModel> users = new ArrayList<>();
        try {
            rs = con.getData("SELECT * FROM `user`");
            while (rs.next()) {
                UserModel user = new UserModel();
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setRegdate(rs.getDate("regdate"));
                users.add(user);
            }
            con.disconnect();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public boolean UserRegister(UserModel user, String pass) {
        return con.runQuery("INSERT INTO `user`(`username`, `email`, `password`, `regdate`) VALUES ('" + user.getUsername() + "','" + user.getEmail() + "','" + pass + "',CURDATE())");
    }

    public boolean UserLogin(String username, String password) {
        boolean login = false;
        rs = con.getData("SELECT * FROM `user` WHERE `username`='" + username + "' AND `password`='" + password + "'");
        try {
            if (rs.next()) {
                login = true;
            }
            con.disconnect();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return login;
    }

    public UserModel getDataUser(String username) {
        UserModel user = new UserModel();
        rs = con.getData("SELECT * FROM `user` WHERE `username`='" + username + "'");
        try {
            if (rs.next()) {
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setRegdate(rs.getDate("regdate"));
            }
            con.disconnect();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return user;
    }

    //</editor-fold>
    // <editor-fold defaultstate="collapsed" desc="DAO Task">
    // your function here
    //</editor-fold>
    // <editor-fold defaultstate="collapsed" desc="DAO LogActivity">
    // your function here
    //</editor-fold>
    // <editor-fold defaultstate="collapsed" desc="DAO Message">
    public ArrayList<MessageModel> getConversation(String username){
        ArrayList<MessageModel> conversation = new ArrayList<>();
        try {
            rs = con.getData("SELECT * FROM `conversation` WHERE `username_to`='"+username+"'");
            while (rs.next()) {
                MessageModel message = new MessageModel();
                message.setIdconversation(rs.getString("id_conversation"));
                message.setUname_from(rs.getString("username_from"));
                message.setUname_to(rs.getString("username_to"));
                message.setDatetime(rs.getDate("datetime"));
                message.setMsg(rs.getString("text"));
                conversation.add(message);
            }
            con.disconnect();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conversation;
    }
//    public boolean sentMessage(MessageModel messageModel) {
//        return con.runQuery();
//    }
    //</editor-fold>
    // <editor-fold defaultstate="collapsed" desc="DAO ProjectMember">
    public ArrayList<ProjectMemberModel> getProjectMember(int projectid) {
        ArrayList<ProjectMemberModel> members = new ArrayList<>();
        rs = con.getData("SELECT * FROM `projectmember` JOIN `user` USING (`username`) WHERE `id_project`='" + projectid + "'");
        try {
            while (rs.next()) {
                ProjectMemberModel member = new ProjectMemberModel();
                UserModel user = new UserModel();
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setRegdate(rs.getDate("regdate"));
                member.setUser(user);
                member.setRole(rs.getString("role"));
                members.add(member);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return members;
    }
    //</editor-fold>
}