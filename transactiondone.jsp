<%
  if(!(session.getAttribute("message")==null))
    out.println("<center>"+session.getAttribute("message")+"</center><br>");
  session.removeAttribute("message");
  if(session.getAttribute("cid")==null || !(session.getAttribute("aid")==null)){
  session.invalidate();
  response.sendRedirect("index.jsp");}
%>
<%@include file="connect.jsp"%>
<%
	int to=Integer.parseInt(request.getParameter("to"));
	int cid=Integer.parseInt(""+session.getAttribute("cid"));
	ResultSet test=con.createStatement().executeQuery("select cid from sql12303120.customer where edit_id in(select max(edit_id) from customer group by cid) and active=1 and cid="+to);
	if(!(test.next()) || to==cid){
		session.setAttribute("message","wrong account number of recipient");
		response.sendRedirect("transact.jsp");
	}else{	
	int tid=0;
	test=con.createStatement().executeQuery("select max(tid) from sql12303120.transaction");
	if(test.next()) {
		tid=test.getInt(1);
	}
	tid=tid+1;
	test=con.createStatement().executeQuery("select max(edit_id) from sql12303120.customer");
	test.next();
	int edit_id=test.getInt(1);
	String changedate=String.valueOf(new java.util.Date());
	double amt=Double.parseDouble(request.getParameter("amount"));
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from sql12303120.customer where cid="+cid+" and edit_id=(select max(edit_id) from sql12303120.customer where cid="+cid+")");
	rs.next();
	if(rs.getDouble("bal")-amt<300){
		session.setAttribute("message","Withdrawing more than allowed");
		response.sendRedirect("cloggedin.jsp");
	}
	else{
	
	PreparedStatement pst1=con.prepareStatement("insert into sql12303120.customer values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
    pst1.setInt(1,cid);
	pst1.setString(2,rs.getString("cname"));
	pst1.setString(3,rs.getString("sex"));
	pst1.setDate(4,rs.getDate("dob"));
	pst1.setDouble(5,rs.getDouble("bal")-amt);//try{
	pst1.setString(6,rs.getString("address"));
	 pst1.setLong(7,rs.getLong("phno"));
	 pst1.setString(8,rs.getString("pwd"));
	 if(session.getAttribute("aid")==null)
	 	pst1.setNull(9,java.sql.Types.INTEGER);
	 else
	 	pst1.setInt(9,Integer.parseInt(""+session.getAttribute("aid")));
	 pst1.setString(10,changedate);
	 pst1.setInt(11,edit_id+1);
	 pst1.setInt(12,1);
	 pst1.setInt(13,tid);
	 
	int t=pst1.executeUpdate();

	rs=stmt.executeQuery("select * from sql12303120.customer where cid="+to+" and edit_id=(select max(edit_id) from sql12303120.customer where cid="+to+")");
	rs.next();
	pst1=con.prepareStatement("insert into sql12303120.customer values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
    pst1.setInt(1,to);
	pst1.setString(2,rs.getString("cname"));
	pst1.setString(3,rs.getString("sex"));
	pst1.setDate(4,rs.getDate("dob"));
	pst1.setDouble(5,rs.getDouble("bal")+amt);//try{
	pst1.setString(6,rs.getString("address"));
	 pst1.setLong(7,rs.getLong("phno"));
	 pst1.setString(8,rs.getString("pwd"));
	 if(session.getAttribute("aid")==null)
	 	pst1.setNull(9,java.sql.Types.INTEGER);
	 else
	 	pst1.setInt(9,Integer.parseInt(""+session.getAttribute("aid")));
	 pst1.setString(10,changedate);
	 pst1.setInt(11,edit_id+2);
	 pst1.setInt(12,1);
	 pst1.setInt(13,tid);
	t=pst1.executeUpdate();

	pst1=con.prepareStatement("insert into sql12303120.transaction values(?,?,?,?,?)");
    pst1.setInt(1,tid);
	pst1.setInt(2,cid);
	pst1.setInt(3,to);
	pst1.setString(4,changedate);
	pst1.setDouble(5,amt);//try{
	
	t=pst1.executeUpdate();
	if(t>0){
	session.setAttribute("message","<h3>Transaction Done successfully</h3>");
	response.sendRedirect("cloggedin.jsp");
	}
	con.close();}}//}catch(Exception e){}
	
	
%>
%>