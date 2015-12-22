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
						<SPAN CLASS="sr-only">Toggle navigation</SPAN> 
						<SPAN CLASS="icon-bar"></SPAN> 
						<SPAN CLASS="icon-bar"></SPAN> 
						<SPAN CLASS="icon-bar"></SPAN>
					</BUTTON>
					<A CLASS="navbar-brand" HREF="welcome.jsp"></A>
				</DIV>
				<DIV CLASS="navbar-collapse collapse">
					<UL CLASS="nav navbar-nav">
						<LI CLASS="active"><A HREF="welcome.jsp">Home</A></LI>
						<LI><A HREF="patientSearch.jsp">Search Patient</A></LI>
						<LI><A HREF="referFriend.jsp">Refer	Friend</A></LI>
						<LI><A HREF="PatientReminder.jsp">Notify Patient</A></LI>
						<LI><A HREF="asq3.jsp">ASQ-3</A></LI>
						<LI CLASS="dropdown"><A HREF="mChart.jsp" CLASS="dropdown-toggle" DATA-TOGGLE="dropdown">M-CHART<B CLASS="caret"></B></A>
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
		
		<DIV CLASS="welcome">
		<DIV CLASS="row">
			<DIV CLASS="col-sd-1"></DIV>
			<DIV CLASS="col-sd-11">
				<H2>What would like you like to do:</H2>
			</DIV>
		</DIV>
		<BR>
		<DIV CLASS="row">
			<DIV CLASS="col-md-1"></DIV>
			<DIV CLASS="col-md-3">
				<A HREF="patientSearch.jsp"><IMG ALT="search" SRC="images/manu-search.png"></A>
				<P>View/Update Patient Records</P>
			</DIV>
			<DIV CLASS="col-md-3">
				<A HREF="referFriend.jsp"><IMG ALT="refer" SRC="images/manu-refer.png"></A>
				<P>Refer a Patient for Evaluation or Early Intervention</P>
			</DIV>
			<DIV CLASS="col-md-4">
				<A HREF="PatientReminder.jsp"><IMG ALT="notify" SRC="images/manu-notify.png"></A>
				<P>Send Reminder to Patient to Complete Screening</P>
			</DIV>
			<DIV CLASS="col-md-1"></DIV>
		</DIV>
		<DIV CLASS="row">
			<DIV CLASS="col-md-2"></DIV>
			<DIV CLASS="col-md-4">
				<A HREF="asq3.jsp"><IMG ALT="view" SRC="images/manu-asq3.png"></A>
				<P>View Ages and Stages Scoring or Access Screening Tool</P>
			</DIV>
			<DIV CLASS="col-md-1"></DIV>
			<DIV CLASS="col-md-3">
				<A HREF="mChart.jsp"><IMG ALT="mchart" SRC="images/manu-chart.png"></A>
				<P>View M-CHAT-R Scoring or Access Screening Tool</P>
			</DIV>
			<DIV CLASS="col-md-2"></DIV>
		</DIV>
		<BR>
	</DIV>
	</DIV>
	<!-- 		<footer id="footer">
			<p style="text-align: center; padding: 0px">&#169;Copyright -GT-FHIR-ISDDA, 2015.</p>
		</footer> -->
</BODY>

<%
	} else {
%>
<jsp:forward page="index.html" />
<%
	}
%>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<SCRIPT
	SRC="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"
	TYPE="text/javascript"></SCRIPT>
<SCRIPT
	SRC="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"
	TYPE="text/javascript"></SCRIPT>
</HTML>