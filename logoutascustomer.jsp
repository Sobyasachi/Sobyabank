<%
	session.removeAttribute("cid");
	session.removeAttribute("cname");
	response.sendRedirect("aloggedin.jsp");
%>