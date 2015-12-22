<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="gt.fhir.isdda.provider.*"%>
<%@ page import="ca.uhn.fhir.model.dstu2.resource.Patient"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat;"%>

<%-- Search Patients by Names and DateBirth --%>
<%
	request.setCharacterEncoding("GB18030");
	String given = request.getParameter("given").trim();
	String family = request.getParameter("family").trim();
	String birthdate = request.getParameter("birthdate").trim();
	
	System.out.println("---REQUEST---##" + given + "-##-" + family	+ "####-" + birthdate);
	
	// Search patients
	int TotalRecords = 0;
	PatientResourceProvider pProvider = new PatientResourceProvider();
	List<Patient> patients;
	if (!"".equals(birthdate)) {
		patients = pProvider.getPatientByBirthdate(birthdate);
	} else {
		patients = pProvider.getPatientByName(given, family);
	}
	TotalRecords = patients.size();
	
	System.out.println("---REQUEST---##" + given + "-##-" + family	+ "####-" + birthdate);
	System.out.println("----TotalRecords----" + TotalRecords);
%>

<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>List of Patients</TITLE>
<META CHARSET="UTF-8">
<LINK REL="stylesheet" HREF="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<LINK HREF="css/main.css" TYPE="text/css" REL="stylesheet">
</HEAD>

<%
	if (TotalRecords > 0) {
%>
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
</BODY>
<%
	} else {
%>
<H3>There Are No Matching Records!</H3>
<%
	}
%>
</HTML>
