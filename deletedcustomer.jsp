<%@include file="connect.jsp" %>
<%
	String cid1=request.getParameter("cid");
	if(session.getAttribute("aid")==null||(""+session.getAttribute("cid")==cid1)){
    response.sendRedirect("adminlogin.jsp");}
    else if(session.getAttribute("aid")==null)
		response.sendRedirect("index.jsp");
	String pwd=request.getParameter("pwd");
	
	
	try{
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from sql12303120.ADMIN where aid="+session.getAttribute("aid")+" and pwd='"+pwd+"'");
		if(cid1.equals("select")){
			con.close();
			response.sendRedirect("deletecustomer.jsp");
		}
	   	else if(rs.next())
	    {
	    	int cid=Integer.parseInt(cid1);
	    	String changedate=String.valueOf(new java.util.Date());
	    	ResultSet test=con.createStatement().executeQuery("select max(edit_id) from sql12303120.customer");
			test.next();
			int edit_id=test.getInt(1);
	    	rs=stmt.executeQuery("select * from sql12303120.customer where cid="+cid+" and edit_id=(select max(edit_id) from sql12303120.customer where cid="+cid+")");
			rs.next();
	    	PreparedStatement pst1=con.prepareStatement("insert into sql12303120.customer values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		    pst1.setInt(1,cid);
			pst1.setString(2,rs.getString("cname"));
			pst1.setString(3,rs.getString("sex"));
			pst1.setDate(4,rs.getDate("dob"));
			pst1.setDouble(5,0);//try{
			pst1.setString(6,rs.getString("address"));
			 pst1.setLong(7,rs.getLong("phno"));
			 pst1.setString(8,rs.getString("pwd"));
			 if(session.getAttribute("aid")==null)
			 	pst1.setNull(9,java.sql.Types.INTEGER);
			 else
			 	pst1.setInt(9,Integer.parseInt(""+session.getAttribute("aid")));
			 pst1.setString(10,changedate);
			 pst1.setInt(11,edit_id+1);
			 pst1.setInt(12,0);
			 pst1.setNull(13,java.sql.Types.INTEGER);
			 
			int t=pst1.executeUpdate();
			con.close();
			if(t>0){
%>
			<h3>Customer deleted Successfully</h3>
			<%@include file="aloggedin.jsp" %>
 <%
	    	}
		    else
		    {
	    	session.invalidate();
%>
<center><font color=red>Invalid password</font>
<%@include file="adminlogin.jsp" %>
<%
			con.close();
			 }
		}
	}
	catch(Exception e){
%>
<center><font color=red>Exception occured</font>
<%
		}
%>