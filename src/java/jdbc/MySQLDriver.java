package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Class koneksi database mysql
 * @author Adiputra Setiawan
 */
public class MySQLDriver {
    // Mysql Database Information Connection

    private final String server = "localhost"; // Server address
    private final int portServer = 3306; // Port Server Database
    private final String dbname = "dbpm"; // Database name
    private final String dbuser = "root"; // User mysql
    private final String dbpass = ""; // Pass mysql
    private Connection con;
    private Statement stmt;
    private boolean connectionDB;

    public MySQLDriver() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://" + server + ":" + portServer + "/" + dbname, dbuser, dbpass);
            stmt = con.createStatement();
            System.out.println("DB connected");
            this.connectionDB = true;
        } catch (ClassNotFoundException | SQLException e) {
            this.connectionDB = false;
            System.out.println("Error at Connecting DB : " + e.getMessage());
        }
    }

    /**
     * run query sql
     *
     * @param sql
     * @return true if this method run query correctly; false otherwise.
     */
    public boolean runQuery(String sql) {
        try {
            int result = stmt.executeUpdate(sql);
            System.out.println(result + " row(s) affected");
            return result > 0;
        } catch (SQLException ex) {
            System.out.println("Error at runQuery: " + ex.getMessage());
            return false;
        }
    }

    /**
     * Get the resultset value of executeQuery sql
     *
     * @param sql
     * @return the value of resultset
     */
    public ResultSet getData(String sql) {
        ResultSet rs = null;
        try {
            rs = stmt.executeQuery(sql);
        } catch (SQLException ex) {
            System.out.println("Error at getData: " + ex.getMessage());
        }
        return rs;
    }

    /**
     * Disconnect from database
     */
    public void disconnect() {
        try {
            stmt.close();
            con.close();
            this.connectionDB = false;
            System.out.println("DB disconnect success ");
        } catch (SQLException ex) {
            System.out.println("Error at disconnect DB : " + ex.getMessage());
        }
    }

    /**
     * Get the value of connectDB
     *
     * @return the value of connection DB MySql
     */
    public boolean isConnected() {
        return connectionDB;
    }
}
//