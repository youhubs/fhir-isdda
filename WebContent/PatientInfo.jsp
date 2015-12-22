<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="gt.fhir.isdda.provider.*"%>
<%@ page import="ca.uhn.fhir.model.dstu2.resource.Patient"%>
<%@ page import="ca.uhn.fhir.model.dstu2.resource.Observation"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat;"%>

<%-- Search Patients by Names and Birthday --%>
<%
	request.setCharacterEncoding("GB18030");
	String pid = request.getParameter("pid").trim();
	String family = request.getParameter("family").trim();
	String given = request.getParameter("given").trim();
	String[] splited = given.split("\\s+");
	given = splited[0];

	System.out.println("&&&&$$$$$$$$$$$$--family--" + given);

	//search patient by Name
	int TotalRecords = 0;
	PatientResourceProvider pProvider = new PatientResourceProvider();
	List<Patient> patients = pProvider.getPatientByName(given, family);
	TotalRecords = patients.size();
	Patient patient = new Patient();
	if (TotalRecords > 0)
		patient = patients.get(0);
%>

<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>List of Patients</TITLE>
<META CHARSET="UTF-8">
<LINK REL="stylesheet" HREF="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<LINK HREF="css/main.css" TYPE="text/css" REL="stylesheet">
<LINK HREF="css/search.css" TYPE="text/css" REL="stylesheet">
</HEAD>
<BODY>
	<DIV CLASS="table-responsive">
		<TABLE CLASS="table">
			<THEAD CLASS="thead">
				<TR>
					<TD>Patient ID</TD>
					<TD>Family Name</TD>
					<TD>Given Name</TD>
					<TD>Gender</TD>
					<TD>BirthDate</TD>
				</TR>
			</THEAD>
			<TBODY>
				<%
					for (int i = 0; i < TotalRecords; i++) {
						Patient p = patients.get(i);
						Date dob = p.getBirthDate();
						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
						String format_dob = dateFormat.format(dob);
				%>
				<TR ONCLICK="PatientInfo()">
					<TD><%=p.getId().getIdPart()%></TD>
					<TD><%=p.getNameFirstRep().getFamilyAsSingleString()%></TD>
					<TD><%=p.getNameFirstRep().getGivenAsSingleString()%></TD>
					<TD><%=p.getGender()%></TD>
					<TD><%=format_dob%></TD>
				</TR>
				<%
					}
				%>
			</TBODY>
		</TABLE>
	</DIV>
	<DIV CLASS="patientInfo">
		<BR />
		<H2><%=patient.getNameFirstRep().getNameAsSingleString()%></H2>
		<BR>
		<DIV CLASS="addr_label">
			<LABEL>Address:</LABEL><BR /> <LABEL>City:</LABEL> <BR /> <LABEL>State:</LABEL>
			<BR /> <LABEL>PostCode:</LABEL><BR />
		</DIV>
		<DIV CLASS="addr_value">
			<DIV ID="row1"><%=patient.getAddressFirstRep().getLineFirstRep()%></DIV>
			<DIV><%=patient.getAddressFirstRep().getCity()%></DIV>
			<DIV><%=patient.getAddressFirstRep().getState()%></DIV>
			<DIV><%=patient.getAddressFirstRep().getPostalCode()%></DIV>
		</DIV>
	</DIV>
</BODY>

<SCRIPT
	SRC="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"
	TYPE="text/javascript"></SCRIPT>
<SCRIPT
	SRC="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"
	TYPE="text/javascript"></SCRIPT>
</HTML>
