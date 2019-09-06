<%@page import="java.util.ArrayList"%>
<%@page import="com.sungyoon.vo.FoodVO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sungyoon.db.DBconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   
    
    Connection conn = DBconn.getConnection(); //Connection 객체 얻기.
    String sql = "Select * from food";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery(); //실행 -> 조회
   
    
    
    //데이터 꾸러미를 담는 그릇
    ArrayList<FoodVO> list = new ArrayList<>();
    
    while (rs.next()){ //검색된 결과가 존재하면 true
        String name = rs.getString("name"); //columnIndex or columnLabel
        String menu = rs.getString("menu"); //columnIndex or columnLabel
        String price = rs.getString("price");
        
        FoodVO vo = new FoodVO();
        vo.setName(name);
        vo.setMenu(menu);
        vo.setPrice(price);    
   
    	list.add(vo);
    }    
    
    rs.close();
    pstmt.close();
    DBconn.close();
    
      %>
       
        <h1>조회결과</h1>
        <table border="1">
      <% for (FoodVO vo : list) { %>
        
            <tr>
                <td>이름</td><td><%=vo.getName() %></td>
            </tr>
            <tr>
                <td>메뉴</td><td><%=vo.getMenu() %></td>
            </tr>
            <tr>
                <td>가격</td><td><%=vo.getPrice() %></td>
            </tr>
     <% } %>
        </table>
   </body>
</html>