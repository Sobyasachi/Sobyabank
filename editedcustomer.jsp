<%
	if(session.getAttribute("cid")==null){
	session.invalidate();
	response.sendRedirect("index.jsp");}
%>
<%@include file="connect.jsp" %>
<%

	String address=request.getParameter("address");
	String sex=request.getParameter("sex");
	long phno=Long.parseLong(request.getParameter("phno"));
	int cid=Integer.parseInt(""+session.getAttribute("cid"));
	

	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from sql12303120.customer where cid="+cid+" and edit_id=(select max(edit_id) from sql12303120.customer where cid="+cid+")");
	rs.next();

	
	double bal=rs.getDouble("bal");
	
	String pwd;
	if(session.getAttribute("aid")==null)
		pwd=request.getParameter("pwd");
	else
		pwd=rs.getString("pwd");

	
	PreparedStatement pst=con.prepareStatement("select max(edit_id) from sql12303120.customer");
	int edit_id=0;
	ResultSet rs1=pst.executeQuery();
	if(rs1.next())
	  edit_id=rs1.getInt("max(edit_id)");
	edit_id=edit_id+1;
	String aid=(String)session.getAttribute("aid");
	java.util.Date dt=new java.util.Date();
	String dt1=String.valueOf(dt);
	long y=phno;
	//BigDecimal y=new BigDecimal(phno);
   	PreparedStatement pst1=con.prepareStatement("insert into sql12303120.customer values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
    pst1.setInt(1,cid);
	pst1.setString(2,""+session.getAttribute("cname"));
	pst1.setString(3,sex);
	pst1.setDate(4,rs.getDate("dob"));
	pst1.setDouble(5,bal);//try{
	pst1.setString(6,address);
	 pst1.setLong(7,y);
	 pst1.setString(8,pwd);
	 if(session.getAttribute("aid")==null)
	 	pst1.setNull(9,java.sql.Types.INTEGER);
	 else
	 	pst1.setInt(9,Integer.parseInt(""+session.getAttribute("aid")));
	 pst1.setString(10,dt1);
	 pst1.setInt(11,edit_id);
	 pst1.setInt(12,1);
	 pst1.setNull(13,java.sql.Types.INTEGER);
	 
	int t=pst1.executeUpdate();
	if(t>0 && session.getAttribute("aid")==null)
	{
		response.sendRedirect("cloggedin.jsp");
		session.setAttribute("message","Account Edited Successfully");
	}
	else if(t>0)
	{
%>
<h3>Customer edit successfully</h3>
<%@include file="aloggedin.jsp" %>
<%
	}
	con.close();//}catch(Exception e){}
	
	
%>
