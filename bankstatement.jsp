<%
  if(!(session.getAttribute("message")==null))
	out.println("<center>"+session.getAttribute("message")+"</center><br>");
  session.removeAttribute("message");
%>
<%
  if(session.getAttribute("cid")==null){
  session.invalidate();
  response.sendRedirect("index.jsp");}
  else{
%>

<%@include file="connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<style>
		th,table,td{
			padding: 20px;
			margin: 20px;
			text-align: center;
		}
	</style>
</head>
<body>
	<center><a href="cloggedin.jsp">Customer Home Page</a><hr><br>
<table border="2" style="width:70%">
	<tr>
		<th>Description</th>
		<th>Amount</th>
		<th>Balance</th>
	</tr>
<%
		int cid=Integer.parseInt(""+session.getAttribute("cid"));
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select bal,tid,edit_id from customer where cid="+cid+" order by edit_id");
		double bal=300.0;
		int k=0;
		while(rs.next())
		{
			String describe="Opening Bank Account";
			double amt=0.0;
			if(k==0){
				out.println("<tr><td>"+describe+"</td><td>"+"</td><td>"+bal+"</td></tr>");k=1;}
			if (rs.getDouble("bal")==bal)
			continue;
			else
			{
				
				Statement stmt1=con.createStatement();
				if(rs.getInt("tid")>0)
				{
					if(rs.getDouble("bal")>bal)
					{
						amt=rs.getDouble("bal")-bal;
						ResultSet test=stmt1.executeQuery("select from_cid from transaction where tid="+rs.getInt("tid"));
						test.next();
						describe="Transferred from account number="+test.getInt(1);
					}
					else if(rs.getDouble("bal")<bal)
					{
						amt=bal-rs.getDouble("bal");
						ResultSet test=stmt1.executeQuery("select to_cid from transaction where tid="+rs.getInt("tid"));
						test.next();
						describe="Transferred to account number="+test.getInt(1);
					}
				}
				else
				{
					if(rs.getDouble("bal")>bal)
					{
						amt=rs.getDouble("bal")-bal;
						describe="Deposited";
					}
					else if(rs.getDouble("bal")<bal)
					{
						amt=bal-rs.getDouble("bal");
						describe="Withdrawn";
					}
				}
			}
			out.println("<tr><td>"+describe+"</td><td>"+amt+"</td><td>"+rs.getDouble("bal")+"</td></tr>");
			bal=rs.getDouble("bal");
		}
%>
</table>
</center>
<%
	}
%>