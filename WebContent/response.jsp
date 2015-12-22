<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="gt.fhir.isdda.provider.*"%>
	
<%-- Send Reminder to Patient's Phone --%>
<%
	request.setCharacterEncoding("GB18030");
	String given = "";
	String family = ""; 
	String phone = "";
	String message = "";
	String email = "";
	if (!"".equals(request.getParameter("given").trim())) {
		given = request.getParameter("given").trim();
	}
	if (!"".equals(request.getParameter("family").trim())) {
		family = request.getParameter("family").trim();
	}
	if (!"".equals(request.getParameter("phone").trim())) {
		phone = request.getParameter("phone").trim().replaceAll("\\D+","");
	}
	if (!"".equals(request.getParameter("msg").trim())) {
		message = request.getParameter("msg").trim();
	}
	if (!"".equals(request.getParameter("email").trim())) {
		email = request.getParameter("email").trim();
	}
	
	System.out.println("####--" + phone + "--##--" + email);
	
	if (!"".equals(phone) && !"".equals(message)) {  
		SmsSender sender = new SmsSender(phone, message);
		sender.sendMessage();
	}
	
	if (!"".equals(email) && !"".equals(message)) {
		GmailSender mailSender = new GmailSender();
		mailSender.setSender("xueyouhu@gmail.com", "hxy76100");
		mailSender.addRecipient(email);
		mailSender.setSubject("Reminder For Your Next Visit!");
		mailSender.setBody(message);
		//mailSender.addAttachment("TestFile.txt");
		mailSender.send();	
	}
%>

<!DOCTYPE html>
<HTML>
<HEAD>
<META CHARSET="UTF-8">
<TITLE>Welcome To ISDDA!</TITLE>
</head>
<BODY>
<p>Your message has been sent!</p>
</BODY>
</HTML>