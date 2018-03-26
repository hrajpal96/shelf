/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connectionproperties;

import com.sun.rowset.JdbcRowSetImpl;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Lenovo
 */
public class ConnectionBean {

    private Connection conn = null;

    public ConnectionBean(String url, String user_name, String password) throws InstantiationException, IllegalAccessException {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            this.conn = DriverManager.getConnection(url, user_name, password);
        } catch (ClassNotFoundException | SQLException e) {
        }

    }

    public Connection getConnection() {
        return this.conn;
    }

    public ResultSet runSql(Connection connection) throws SQLException {
        return new JdbcRowSetImpl(connection);
    }
}
