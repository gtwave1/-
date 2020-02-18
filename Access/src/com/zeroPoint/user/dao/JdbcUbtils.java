package com.zeroPoint.user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUbtils {
	public static final String URL = "jdbc:mysql://localhost:3306/databaseweb?characterEncoding=utf-8";
	public static final String USER = "root";
	public static final String PASS = "gt1010992686";
	
	private static Connection conn = null;
	static {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				conn = DriverManager.getConnection(URL,USER,PASS);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() {
		
		return conn;
		
	}
}

