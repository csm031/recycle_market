package common;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBCP {
    protected Connection conn;
    protected PreparedStatement pstmt;
    protected ResultSet rs;

    public DBCP() {
        try {
            Context initCtx = new InitialContext();
            Context ctx = (Context) initCtx.lookup("java:comp/env");
            DataSource source = (DataSource) ctx.lookup("oracle_dbcp");

            conn = source.getConnection();

            System.out.println("DBCP success");
        } catch (NamingException | SQLException e) {
            System.out.println("DBCP fail");
            e.printStackTrace();
        }
    }
    public void close () {
        try {

            if (conn != null) {
                conn.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (rs != null) {
                rs.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
