<%@include file="connect.jsp" %>
<%
	if(session.getAttribute("aid")==null)
	response.sendRedirect("adminlogin.jsp");
	else{
		String submit=request.getParameter("submit");
		double amount=Double.parseDouble(request.getParameter("amt"));
		int cid=Integer.parseInt(request.getParameter("cid"));

		if(submit.equals("withdraw")){amount=0-amount;}

		Statement stmt=con.createStatement();
		String changedate=String.valueOf(new java.util.Date());
		ResultSet rs=stmt.executeQuery("select * from sql12303120.customer where cid="+cid+" and edit_id=(select max(edit_id) from sql12303120.customer where cid="+cid+")");
		rs.next();
		double bal=rs.getDouble("bal");
		if(rs.getDouble("bal")+amount<300 && submit.equals("withdraw")){
			session.setAttribute("message","Withdrawing more than allowed");
			response.sendRedirect("aloggedin.jsp");
		}
		else{
		PreparedStatement pst=con.prepareStatement("select max(edit_id) from sql12303120.customer");
		int edit_id=0;
		ResultSet rs1=pst.executeQuery();
		if(rs1.next())
		edit_id=rs1.getInt("max(edit_id)");
		edit_id=edit_id+1;
		String aid=(String)session.getAttribute("aid");
		//BigDecimal y=new BigDecimal(phno);
		PreparedStatement pst1=con.prepareStatement("insert into sql12303120.customer values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		pst1.setInt(1,cid);
		pst1.setString(2,rs.getString("cname"));
		pst1.setString(3,rs.getString("sex"));
		pst1.setDate(4,rs.getDate("dob"));
		pst1.setDouble(5,rs.getDouble("bal")+amount);//try{
		pst1.setString(6,rs.getString("address"));
		 pst1.setLong(7,rs.getLong("phno"));
		 pst1.setString(8,rs.getString("pwd"));
		if(session.getAttribute("aid")==null)
		 	pst1.setNull(9,java.sql.Types.INTEGER);
		else
			pst1.setInt(9,Integer.parseInt(""+session.getAttribute("aid")));
		pst1.setString(10,changedate);
		pst1.setInt(11,edit_id);
		pst1.setInt(12,1);
		pst1.setNull(13,java.sql.Types.INTEGER);

		int t=pst1.executeUpdate();
		session.setAttribute("message","Service executed successfully");
		response.sendRedirect("aloggedin.jsp");
%>

<%
		}
	}
%>