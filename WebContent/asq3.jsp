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
						<LI><A HREF="#"><SPAN CLASS="glyphicon glyphicon-user"></SPAN>&nbsp;Sign
								Up</A></LI>
						<LI><A HREF="index.html"><SPAN
								CLASS="glyphicon glyphicon-log-in"></SPAN>&nbsp;Logout</A></LI>
					</UL>
				</DIV>
			</DIV>
		</NAV>

		<DIV CLASS="row">
			<DIV CLASS="col-sm-1"></DIV>
			<DIV CLASS="col-sm-1">
				<IMG ALT="asq3" SRC="images/manu-asq3.png">
			</DIV>
			<DIV CLASS="col-sm-9">
				<H2>Ages & Stages Questionnaires®, Third Edition (ASQ-3™)</H2>
			</DIV>
		</DIV>
		<BR>
		<DIV CLASS="row">
			<DIV CLASS="col-sm-1"></DIV>
			<DIV CLASS="col-sm-10">
				<P>Ages & Stages Questionnaires, Third Edition (ASQ-3) is a
					developmental screening tool designed for use by early educators
					and health care professionals. It relies on parents as experts, is
					easy-to-use, family-friendly and creates the snapshot needed to
					catch delays and celebrate milestones.</P>
				<P>The ASQ-3 pinpoints developmental progress in children
					between the ages of one month to 5 ½ years. Evidence shows that the
					earlier development is assessed - the greater the chance a child
					has to reach his or her potential. The ASQ-3 should be taken at 9
					months, 18 months, and 24 months.</P>
			</DIV>
		</DIV>
		<BR>

		<DIV CLASS="row">
			<DIV CLASS="col-sm-1"></DIV>
			<DIV CLASS="col-sm-2">
				<IMG ALT="asq3" SRC="images/asq3.png">
			</DIV>
			<DIV CLASS="col-sm-8">
				<UL>
					<LI><A HREF="pdf/ASQ9Months.pdf" TARGET="_blank">Link to 9
							month ASQ 3 Questionnaire PDF</A></LI>
					<LI><A HREF="pdf/ASQ18Months.pdf" TARGET="_blank">Link to
							18 month ASQ 3 Questionnaire PDF</A></LI>
					<LI><A HREF="pdf/ASQ24Months.pdf" TARGET="_blank">Link to
							24 month ASQ 3 Questionnaire PDF</A></LI>
				</UL>
			</DIV>
		</DIV><BR><BR>

		<!-- 		<footer id="footer">
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

<SCRIPT
	SRC="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"
	TYPE="text/javascript"></SCRIPT>
<SCRIPT
	SRC="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"
	TYPE="text/javascript"></SCRIPT>
</HTML>