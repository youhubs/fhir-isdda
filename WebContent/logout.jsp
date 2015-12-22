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
		session.removeAttribute("name");
		session.removeAttribute("password");
		session.invalidate();
	%>
	<jsp:forward page="index.html" />
</BODY>
</HTML>