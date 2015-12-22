<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="gt.fhir.isdda.provider.*"%>

<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<HTML>
<HEAD>
<META CHARSET="UTF-8">
<META HTTP-EQUIV="X-UA-Compatible" CONTENT="IE=edge">
<META NAME="viewport" CONTENT="width=device-width, initial-scale=1">
<META NAME="description" CONTENT="Navbar tutorial from BootstrapBay.com">
<TITLE>Welcome To ISDDA!</TITLE>
<LINK REL="stylesheet" HREF="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<LINK HREF="css/main.css" TYPE="text/css" REL="stylesheet">
</HEAD>

<%
	if ((session.getAttribute("name")) != null
			&& (session.getAttribute("password") != null)) {
%>
<BODY>
	<DIV CLASS="container">
		<DIV CLASS="jumbotron">
			<DIV>
				<P ID="welcome">
					Welcome&nbsp;<%=session.getAttribute("name")%>&#33;
				</P>
			</DIV>
		</DIV>

		<NAV CLASS="navbar navbar-inverse">
			<DIV CLASS="container-fluid">
				<DIV CLASS="navbar-header">
					<BUTTON TYPE="button" CLASS="navbar-toggle" DATA-TOGGLE="collapse"
						DATA-TARGET=".navbar-collapse">
						<SPAN CLASS="sr-only">Toggle navigation</SPAN> <SPAN
							CLASS="icon-bar"></SPAN> <SPAN CLASS="icon-bar"></SPAN> <SPAN
							CLASS="icon-bar"></SPAN>
					</BUTTON>
					<A CLASS="navbar-brand" HREF="welcome.jsp"></A>
				</DIV>
				<DIV CLASS="navbar-collapse collapse">
					<UL CLASS="nav navbar-nav">
						<LI CLASS="active"><A HREF="welcome.jsp">Home</A></LI>
						<LI><A HREF="patientSearch.jsp">Search Patient</A></LI>
						<LI><A HREF="referFriend.jsp">Refer Friend</A></LI>
						<LI><A HREF="PatientReminder.jsp">Notify Patient</A></LI>
						<LI><A HREF="asq3.jsp">ASQ-3</A></LI>
						<LI CLASS="dropdown"><A HREF="mChart.jsp"
							CLASS="dropdown-toggle" DATA-TOGGLE="dropdown">M-CHART<B
								CLASS="caret"></B></A>
							<UL CLASS="dropdown-menu">
								<!-- <LI CLASS="dropdown-header">M-CHART</LI> -->
								<LI><A HREF="mChart.jsp">General Information</A></LI>
								<LI><A HREF="mChartScore.jsp">Scoring Algorithm</A></LI>
								<LI><A HREF="mChartGraphy.jsp">Graphical Representation</A></LI>
							</UL></LI>
					</UL>
					<UL CLASS="nav navbar-nav navbar-right">
	<!-- 					<LI><A HREF="#"><SPAN CLASS="glyphicon glyphicon-user"></SPAN>&nbsp;Sign Up</A></LI> -->
						<LI><A HREF="index.html"><SPAN CLASS="glyphicon glyphicon-log-in"></SPAN>&nbsp;Logout</A></LI>
					</UL>
				</DIV>
			</DIV>
		</NAV>
		
		<DIV CLASS="row">
		<H2>Send a Patient Reminder</H2><BR>
			<DIV CLASS="col-md-2"></DIV>
			<DIV CLASS="col-md-8">
				<FORM CLASS="form-horizontal" ROLE="form" ACTION="">
						<DIV CLASS="form-group">
							<LABEL CLASS="control-label col-md-4" FOR="name">Patient Name:</LABEL>
							 <DIV CLASS="col-md-8">
							<INPUT TYPE="text" CLASS="form-control" ID="name" PLACEHOLDER="patient name"></DIV>																
						</DIV>
						<DIV CLASS="form-group">
							<LABEL CLASS=" control-label col-md-4" FOR="email">Patient's Email*:</LABEL> 
							<DIV CLASS="col-md-8">
							<INPUT TYPE="email" CLASS="form-control" ID="email" PLACEHOLDER="patient@gmail.com"></DIV>	
						</DIV>
						<DIV CLASS="form-group">
							<LABEL CLASS="control-label col-md-4" FOR="phone">Phone Number*:</LABEL> 
							<DIV CLASS="col-md-8">
							<INPUT TYPE="text" CLASS="form-control" ID="phone" PLACEHOLDER="555-55-5555"></DIV>
						</DIV>
						<DIV CLASS="form-group">
							<LABEL CLASS="control-label col-md-4" FOR="tool">Screening Tool:</LABEL> 
							<div class="checkbox col-md-3">
						        <label><input type="checkbox">MChart-R</label>
						      </div>
						      <div class="checkbox col-md-3">
						        <label><input type="checkbox">ASQ-3</label>
						      </div>
						</DIV>
						<DIV CLASS="form-group">
							<LABEL CLASS="control-label col-md-4" FOR="message">Your Message *</LABEL>
							<div class="col-md-8">
							<TEXTAREA CLASS="form-control" ROWS="5" ID="message" COLS="">Please complete the recommended screening tool prior to your next well-child appointment and bring the results with you to discuss with your pediatrician.</TEXTAREA>
						</DIV>
						</DIV>
						<BUTTON TYPE="submit" CLASS="btn btn-default" ONCLICK="sendMessage()">Send Message</BUTTON>
				</FORM>
			</DIV>
			<DIV CLASS="col-md-2"></DIV>
		</DIV><BR>
		
		<!-- <footer id="footer">
			<p style="text-align: center; padding: 0px">&#169;Copyright -GT-FHIR-ISDDA, 2015.</p>
		</footer> -->
	</DIV>
</BODY>
<%
	} else {
%>
<jsp:forward page="index.html" />
<%
	}
%>

<SCRIPT SRC="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"	TYPE="text/javascript"></SCRIPT>
<SCRIPT SRC="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" TYPE="text/javascript"></SCRIPT>
<SCRIPT TYPE="text/javascript">
	var request;
	function sendMessage() {
		var family = document.querySelector('#name').value;
		var given = document.querySelector("#name").value;
		var phone = document.querySelector("#phone").value;
		var message = document.querySelector("#message").value;
		var email = document.querySelector("#email").value;
		var url = "response.jsp?family=" + family + "&given=" + given
				+ "&phone=" + phone + "&email=" + email + "&msg=" + message;
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}
		try {
			request.onreadystatechange = getInfo();
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Failed To Connect To Server!");
		}
		function getInfo() {
			if (request.readyState == 4) {
				document.getElementById('right_section').innerHTML = request.responseText;
				alert("Your message has been sent!");
			}
		}
	}
</SCRIPT>
</HTML>