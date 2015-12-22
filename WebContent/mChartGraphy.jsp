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
						<LI><A HREF="#"><SPAN CLASS="glyphicon glyphicon-user"></SPAN>&nbsp;Sign Up</A></LI>
						<LI><A HREF="index.html"><SPAN
								CLASS="glyphicon glyphicon-log-in"></SPAN>&nbsp;Logout</A></LI>
					</UL>
				</DIV>
			</DIV>
		</NAV>

		<DIV CLASS="row">
			<DIV CLASS="col-sm-1"></DIV>
			<DIV CLASS="col-sm-1">
				<IMG ALT="mChart" SRC="images/manu-chart.png">
			</DIV>
			<DIV CLASS="col-sm-9">
				<H2>M-CHAT-RTM Graphical Representation</H2>
			</DIV>
		</DIV>
		<BR>		
		<DIV CLASS="row">
			<DIV CLASS="col-sm-1"></DIV>
			<DIV CLASS="col-sm-3">
				<P>No action required. Screen again at 2 years of age.</P>
			</DIV>
			<DIV CLASS="col-sm-3">
				<P>Complete M-CHAT Follow up to
				determine next steps.</P>
			</DIV>
			<DIV CLASS="col-sm-3">
				<P>Bypass Follow up. Refer for
				evaluation and intervention</P>
			</DIV>
		</DIV><BR>
		
		<DIV CLASS="row">
			<DIV CLASS="col-sm-1"></DIV>
			<DIV CLASS="col-sm-3">
				<IMG ALT="age1" SRC="images/age1.png">
			</DIV>
			<DIV CLASS="col-sm-3">
				<IMG ALT="age2" SRC="images/age2.gif">
			</DIV>
			<DIV CLASS="col-sm-3">
				<IMG ALT="age3" SRC="images/age3.png">
			</DIV>
		</DIV><BR>
		<DIV CLASS="row">
			<DIV CLASS="col-sm-1"></DIV>
			<DIV CLASS="col-sm-9">
				<IMG CLASS="img-responsive" ALT="ages" SRC="images/ages.png">
			</DIV>
		</DIV><BR><BR><BR>
		
<!-- <footer class="footer">
  <div class="navbar-fixed-bottom" >
    <p class="text-muted">&#169;Copyright -GT-FHIR-ISDDA, 2015.</p>
  </div>
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