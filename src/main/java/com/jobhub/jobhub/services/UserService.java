package com.jobhub.jobhub.services;

import com.jobhub.jobhub.configs.DatabaseConnection;
import com.jobhub.jobhub.models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {
  public boolean registerUser(String username, String password, String role) throws SQLException, ClassNotFoundException {
    Connection con = DatabaseConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("insert into users(username, password, role) values(?,?,?)");
    ps.setString(1, username);
    ps.setString(2, password);
    ps.setString(3, role);
    int rs = ps.executeUpdate();
    return rs > 0;

  }


  public User authenticate(String username, String password) throws SQLException, ClassNotFoundException {
    Connection conn = DatabaseConnection.getConnection();
    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
    stmt.setString(1, username);
    stmt.setString(2, password);
    ResultSet rs = stmt.executeQuery();
    if (rs.next()) {
      return new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("role"));

    }
    conn.close();
    return null;
  }
}


