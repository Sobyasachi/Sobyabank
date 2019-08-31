<%@include file="connect.jsp"%>

<%@page import="java.sql.*"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.math.BigDecimal"%>
<%
	if(session.getAttribute("aid")==null)
    	response.sendRedirect("aloggedin.jsp");
	String cname=request.getParameter("cname");
	String sex=request.getParameter("sex");
	String dob1=request.getParameter("dob");
	int bal=Integer.parseInt(request.getParameter("bal"));
	String adr=request.getParameter("adr");
	String phno=request.getParameter("phno");
	String pwd=request.getParameter("pwd");
	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date dob=format.parse(dob1);
	
	PreparedStatement pst=con.prepareStatement("select max(cid) from sql12303120.customer");
	int cid=0;
	ResultSet rs=pst.executeQuery();
	if(rs.next())
	  cid=rs.getInt(1);
	cid=cid+1;
	pst=con.prepareStatement("select max(edit_id) from sql12303120.customer");
	int edit_id=0;
	rs=pst.executeQuery();
	if(rs.next())
	  edit_id=rs.getInt(1);
	edit_id=edit_id+1;
	String aid=(String)session.getAttribute("aid");
	java.util.Date dt=new java.util.Date();
	String dt1=String.valueOf(dt);
	long y=Long.parseLong(phno);
	//BigDecimal y=new BigDecimal(phno);
   	PreparedStatement pst1=con.prepareStatement("insert into sql12303120.customer values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
    pst1.setInt(1,cid);
	pst1.setString(2,cname);
	pst1.setString(3,sex);
	pst1.setDate(4,new java.sql.Date(dob.getTime()));
	pst1.setInt(5,bal);//try{
	pst1.setString(6,adr);
	 pst1.setLong(7,y);
	 pst1.setString(8,pwd);
	 pst1.setInt(9,Integer.parseInt(""+session.getAttribute("aid")));
	 pst1.setString(10,dt1);
	 pst1.setInt(11,edit_id);
	 pst1.setInt(12,1);
	 pst1.setNull(13,java.sql.Types.INTEGER);
	int t=pst1.executeUpdate();
	if(t>0){
%>
<h3>Customer created successfully</h3>
<%@include file="aloggedin.jsp" %>
<%
	}
	con.close();//}catch(Exception e){}
	
	
%>
