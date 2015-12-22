<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<LINK REL="stylesheet"
	HREF="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<LINK HREF="css/main.css" TYPE="text/css" REL="stylesheet">
<LINK HREF="css/refer.css" TYPE="text/css" REL="stylesheet">
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
						<!-- <LI><A HREF="#"><SPAN CLASS="glyphicon glyphicon-user"></SPAN>&nbsp;Sign Up</A></LI> -->
						<LI><A HREF="index.html"><SPAN CLASS="glyphicon glyphicon-log-in"></SPAN>&nbsp;Logout</A></LI>
					</UL>
				</DIV>
			</DIV>
		</NAV>

		<DIV CLASS="row">
			<DIV CLASS="col-md-3"></DIV>
			<DIV CLASS="col-md-6">
				<FORM CLASS="form" ROLE="form" ACTION="">
					<FIELDSET>
						<LEGEND>Refer A Friend</LEGEND>
						<DIV CLASS="form-group">
							<LABEL FOR="name">Your Name</LABEL> <INPUT TYPE="text"
								CLASS="form-control" ID="name" PLACEHOLDER="your name">
						</DIV>
						<DIV CLASS="form-group">
							<LABEL FOR="email">Your Friend's Email Address *</LABEL> <INPUT
								TYPE="email" CLASS="form-control" ID="email"
								PLACEHOLDER="friend@gmail.com">
						</DIV>
						<DIV CLASS="form-group">
							<LABEL FOR="phone">Your Friend's Phone Number *</LABEL> <INPUT
								TYPE="text" CLASS="form-control" ID="phone"
								PLACEHOLDER="555-55-5555">
						</DIV>
						<DIV CLASS="form-group">
							<LABEL FOR="message">Your Message *</LABEL>
							<TEXTAREA CLASS="form-control" ROWS="3" ID="message" COLS="">Please come and visit us! Or you can call us at 555-55-5555.</TEXTAREA>
						</DIV>
						<BUTTON TYPE="submit" CLASS="btn btn-default" ONCLICK="sendMail()">Submit</BUTTON>
					</FIELDSET>
				</FORM>
			</DIV>
			<DIV CLASS="col-md-3"></DIV>
		</DIV><BR>

		<!-- <footer id="footer">
			<p style="text-align: center; padding: 0px">&#169;Copyright -GT-FHIR-ISDDA, 2015.</p>
		</footer> -->
		<DIV></DIV>
	</DIV>
</BODY>

<%
	} else {
%>
<jsp:forward page="index.html" />
<%
	}
%>

<SCRIPT
	SRC="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"
	TYPE="text/javascript"></SCRIPT>
<SCRIPT
	SRC="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"
	TYPE="text/javascript"></SCRIPT>
<SCRIPT TYPE="text/javascript">
	var request;
	function sendMail() {
		var family = document.querySelector('#name').value;
		var given = document.querySelector('#name').value;
		var phone = document.querySelector("#phone").value;
		var msg = document.querySelector("#message").value;
		var email = document.querySelector("#email").value;
		var url = "response.jsp?family=" + family + "&given=" + given
				+ "&phone=" + phone + "&email=" + email + "&msg=" + msg;
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
			}
		}
	}
</SCRIPT>
</HTML>