package com.jobhub.jobhub.services;

import com.jobhub.jobhub.configs.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public
class JobService {
  public void postJob(String title, String description) throws SQLException, ClassNotFoundException {
    Connection conn = DatabaseConnection.getConnection();
    PreparedStatement stmt = conn.prepareStatement("INSERT INTO jobs (title, description) VALUES (?, ?)");
    stmt.setString(1, title);
    stmt.setString(2, description);
    stmt.executeUpdate();
    conn.close();
  }
}