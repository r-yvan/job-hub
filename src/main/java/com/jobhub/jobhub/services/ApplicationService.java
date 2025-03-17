package com.jobhub.jobhub.services;

import com.jobhub.jobhub.configs.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public
class ApplicationService {
  public void applyForJob(int jobId, String employeeName) throws SQLException, ClassNotFoundException {
    Connection conn = DatabaseConnection.getConnection();
    PreparedStatement stmt = conn.prepareStatement("INSERT INTO job_applications (job_id, employee_name, status) VALUES (?, ?, 'Pending')");
    stmt.setInt(1, jobId);
    stmt.setString(2, employeeName);
    stmt.executeUpdate();
    conn.close();
  }

  public void updateApplicationStatus(int applicationId, String status) throws SQLException, ClassNotFoundException {
    Connection conn = DatabaseConnection.getConnection();
    PreparedStatement stmt = conn.prepareStatement("UPDATE job_applications SET status = ? WHERE id = ?");
    stmt.setString(1, status);
    stmt.setInt(2, applicationId);
    stmt.executeUpdate();
    conn.close();
  }
}
