<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<HTML>
<HEAD>
<META CHARSET="UTF-8">
<TITLE>ISDDA Login</TITLE>
</HEAD>
<BODY>
	<%
		String fname = null, fpassword = null;
		try {
			session.setAttribute("name", null);
			session.setAttribute("password", null);
			fname = request.getParameter("name");
			fpassword = request.getParameter("password");
			if (fname.equals("admin") && fpassword.equals("admin")) {
				session.setAttribute("name", fname);
				session.setAttribute("password", fpassword);
	%>
	<jsp:forward page="welcome.jsp" />
	<%
		} else {
	%>
	<jsp:forward page="index.html" />
	<%
		}
		} catch (Exception e) {
			System.out.println("errror" + e);
		}
	%>
</BODY>
</HTML>