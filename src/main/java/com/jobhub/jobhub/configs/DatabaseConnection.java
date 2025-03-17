package com.jobhub.jobhub.configs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
  private static final String URL = "jdbc:postgresql://localhost:5432/jobhub";
  private static final String USER = "postgres";
  private static final String PASSWORD = "Nry369&2008";

  public static Connection getConnection() throws SQLException, ClassNotFoundException {
    Class.forName("org.postgresql.Driver");
    return DriverManager.getConnection(URL, USER, PASSWORD);
  }
}