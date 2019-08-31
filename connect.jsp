<%@page import="java.sql.*" %>
<%!
	Connection con=null;
%>
<%
	try{
	Class.forName("com.mysql.jdbc.Driver");
	con=(Connection)DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12303120","sql12303120","2vA4ZG5gSn");
	}
	catch(Exception e){}
%>
