package com.sungyoon.db;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
 
public class DBconn {
    private static Connection dbConn;
   
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
               
        if(dbConn == null){        
           
            String driverName="com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://kndb.cgeibryw8lcg.ap-northeast-2.rds.amazonaws.com:3306/knuser2";
            String id = "knuser2";
            String pwd ="1234";
           
            Class.forName(driverName);     
            System.out.println("드라이버로드");
            dbConn = DriverManager.getConnection(url, id, pwd);
            System.out.println("DB연결성공!");
        }
       
       
        return dbConn;
    }   
    public static void close() throws SQLException{
        if(dbConn!=null){   
            System.out.println("conn닫기()");
            if(!dbConn.isClosed()){
                dbConn.close();
            }           
        } 
        dbConn = null;        
    }   
} 
