<%@include file="connect.jsp" %>
<%
	String cid=request.getParameter("cid");
	String pwd="";
	if(session.getAttribute("aid")==null)
	pwd=request.getParameter("pwd");
	//out.println(pwd);
	try{
		Statement stmt=con.createStatement();
		ResultSet rs;
		if(session.getAttribute("aid")==null)
		rs=stmt.executeQuery("select * from sql12303120.customer where cid="+cid+" and pwd='"+pwd+"' and edit_id=(select max(edit_id) from sql12303120.customer where cid="+cid+")");
		//rs=stmt.executeQuery("select * from sql12303120.customer where cid="+cid+" and pwd='"+pwd+"'");
		else
		rs=stmt.executeQuery("select * from sql12303120.customer where cid="+cid+" and edit_id=(select max(edit_id) from sql12303120.customer where cid="+cid+")");
	   	if(rs.next())
	    {
			session.setAttribute("cname",rs.getString(2));
			session.setAttribute("cid",cid);
			response.sendRedirect("cloggedin.jsp");
	    }
	    else
	    {
	    	session.setAttribute("message","<center><font color=red>Incorrect Password</font></center>");
			response.sendRedirect("index.jsp");
		}
	    con.close();
	}
	catch(SQLSyntaxErrorException e){
%>
<center><font color=red>Exception Occurred<br>Enter Id(number)</font></center><br>
<%@include file="index.jsp" %>
<%
	}
	catch(Exception e){
	//out.println(e);
%>
<center><font color=red>Exception occured</font></center>
<%@include file="index.jsp" %>
<%
	}
%>
