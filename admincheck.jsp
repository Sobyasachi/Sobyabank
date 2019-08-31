<%@include file="connect.jsp" %>
<%
	String aid=request.getParameter("aid");
	String pwd=request.getParameter("pwd");

	try{
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from ADMIN where aid="+aid+" and pwd='"+pwd+"'");
	   	if(rs.next())
	    {
			session.setAttribute("aname",rs.getString(2));
			session.setAttribute("aid",aid);
			response.sendRedirect("aloggedin.jsp");
	    }
	    else
	    {
	    	session.invalidate();
%>
<center><font color=red>Invalid userid or password</font>
<%@include file="adminlogin.jsp" %>
<%
	     }
	    con.close();
	}
	catch(SQLSyntaxErrorException e){
%>
<center><font color=red>Exception Occurred<br>Enter Id(number)</font></center><br>
<%@include file="adminlogin.jsp" %>
<%
	}
	catch(Exception e){
	//out.println(e);
%>
<center><font color=red>Exception occured</font></center>
<%@include file="adminlogin.jsp" %>
<%
	}
%>
