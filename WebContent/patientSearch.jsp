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
<LINK HREF="css/search.css" TYPE="text/css" REL="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<SCRIPT TYPE="text/javascript">
	window.onload = function () { listPatient(); };
</SCRIPT>
<SCRIPT TYPE="text/javascript">
	var request;
	$(function(){
		$('#search').on('click', function (e) {
			e.preventDefault();
			var family = document.querySelector('#family').value;
			var given = document.querySelector('#given').value;
			var birthdate = document.querySelector('#birthdate').value;
			var url = "PatientList.jsp?family=" + family + "&given=" + given + "&birthdate=" + birthdate;
			
			if (window.XMLHttpRequest) {
				request = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				request = new ActiveXObject("Microsoft.XMLHTTP");
			}
			try {
				request.onreadystatechange = getInfo;
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
		});	    
	});
	
	$(function(){
		$('#list').on('click', function (e) {
			e.preventDefault();
			var url = "PatientList.jsp?family=" + "" + "&given=" + "" + "&birthdate=" + "";
			if (window.XMLHttpRequest) {
				request = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				request = new ActiveXObject("Microsoft.XMLHTTP");
			}
			try {
				request.onreadystatechange = getInfo;
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
		});	    
	});	
	function listPatient() {
		var url = "PatientList.jsp?family=" + "" + "&given=" + "" + "&birthdate=" + "";
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}
		try {
			request.onreadystatechange = getInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Failed To Connect To Server!");
		}
	}
	
	function PatientInfo() {
		var table = document.getElementsByTagName("table")[0];
		var tbody = table.getElementsByTagName("tbody")[0];
		tbody.onclick = function (e) {
		    e = e || window.event;
		    var data = [];
		    var target = e.srcElement || e.target;
		    while (target && target.nodeName !== "TR") {
		        target = target.parentNode;
		    }
		    if (target) {
		        var cells = target.getElementsByTagName("td");
		        for (var i = 0; i < cells.length; i++) {
		            data.push(cells[i].innerHTML);
		        }
		    }
		    var pid = data[0];
		    var family = data[1];
		    var given = data[2];
		    var url = "PatientInfo.jsp?given=" + given + "&family=" + family + "&pid=" + pid;
		    
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		try {
			request.onreadystatechange = getInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Failed To Connect To Server!");
		}		    
		};        
	}
	
	function getInfo() {
		if (request.readyState == 4) {
			document.getElementById('right_section').innerHTML = request.responseText;
		}
	}
	
	function validateForm() {
		var birthday = document.form.birthday.value;
		if (!birthday.trim()) {
			birthday = "";
		} else if (isValidDate(birthday)){
			alert("Please enter: yyyy-mm-dd");
		}		
	}
</SCRIPT>
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
<!-- 						<LI><A HREF="#"><SPAN CLASS="glyphicon glyphicon-user"></SPAN>&nbsp;Sign
								Up</A></LI> -->
						<LI><A HREF="index.html"><SPAN CLASS="glyphicon glyphicon-log-in"></SPAN>&nbsp;Logout</A></LI>
					</UL>
				</DIV>
			</DIV>
		</NAV><BR>

		<!--  Search Form -->
		<DIV CLASS="row">
			<DIV CLASS="col-md-4">
				<DIV CLASS="col-md-2"></DIV>
				<DIV CLASS="col-md-10">
						<FORM ROLE="form" METHOD="post" ACTION="">
							<DIV CLASS="form-group">
								<LABEL CLASS="control-label" FOR="given">First Name:</LABEL> <INPUT
									CLASS="form-control" TYPE="text" NAME="given" ID="given">
							</DIV>
							<DIV CLASS="form-group">
								<LABEL CLASS="control-label" FOR="family">Last Name:</LABEL> <INPUT
									CLASS="form-control" TYPE="text" NAME="family" ID="family">
							</DIV>
							<DIV CLASS="form-group">
								<LABEL CLASS="control-label" FOR="birthdate">Birthdate:</LABEL> <INPUT
									CLASS="form-control" TYPE="text" NAME="birthdate" ID="birthdate" PLACEHOLDER="yyyy-mm-dd">
							</DIV>
<!-- 							<DIV CLASS="form-group">
								<LABEL CLASS="control-label" FOR="address">Address:</LABEL> <INPUT
									CLASS="form-control" TYPE="text" NAME="address" ID="address">
							</DIV> -->
							<BUTTON TYPE="submit" ID="search" >Search</BUTTON>&nbsp;&nbsp;
							<BUTTON TYPE="submit" ID="list">List Patient</BUTTON>
						</FORM>
				</DIV>
			</DIV>
			<DIV CLASS="col-md-7" ID="right_section"></DIV>
		</DIV>

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
</HTML>