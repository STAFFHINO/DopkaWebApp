package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static Connection connection;
    private static final String url = "jdbc:postgresql://localhost:5432/postgres";
    private static final String user = "postgres";
    private static final String password = "ateez";
    private static final String db_driver = "org.postgresql.Driver";
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName(db_driver);
        connection = DriverManager.getConnection(url, user, password);
        return connection;
    }
}
