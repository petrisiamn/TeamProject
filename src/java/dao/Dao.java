package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import jdbc.MySQLDriver;
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
    public ArrayList<ProjectModel> getAllProject(int userid) {
        ArrayList<ProjectModel> projects = new ArrayList<>();
        try {
            //con = new MySQLDriver();
            rs = con.getData("SELECT * FROM `projectmember` JOIN `project` USING (`id_project`) WHERE `id_user`=" + userid);

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
    // </editor-fold>

    // <editor-fold defaultstate="collapsed" desc="DAO UserModel">
    public ArrayList<UserModel> getMemberProject() {
        ArrayList<UserModel> users = new ArrayList<>();
        try {
            rs = con.getData("SELECT * FROM `user`");
            while (rs.next()) {
                UserModel user = new UserModel();
                user.setUserid(rs.getInt("id_user"));
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
        return con.runQuery("INSERT INTO `user`(`id_user`, `username`, `email`, `password`, `regdate`) VALUES (NULL,'" + user.getUsername() + "','" + user.getEmail() + "','" + pass + "',CURDATE())");
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
                user.setUserid(rs.getInt("id_user"));
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
    // your function here
    //</editor-fold>
    // <editor-fold defaultstate="collapsed" desc="DAO ProjectMember">
    // your function here
    //</editor-fold>
}
