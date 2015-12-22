package gt.fhir.isdda.servlet;

import gt.fhir.isdda.provider.PatientResourceProvider;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ca.uhn.fhir.model.dstu2.resource.Patient;

/**
 * Servlet implementation class PatientServlet1
 */
public class PatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PatientResourceProvider prp = new PatientResourceProvider();
		String req = request.getParameter("patientName");
	    List<Patient> patients = prp.getPatientByGivenName(req);
	    response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
	    response.setCharacterEncoding("UTF-8"); 
	    response.getWriter().write("Number of Patients found is: " + patients.size());
	    for (int i=0; i<patients.size(); i++) {
	    	Patient p = patients.get(i);
			Date dob = (Date) p.getBirthDate();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String format_dob = dateFormat.format(dob);
	    	response.getWriter().append("Family Name: " + p.getNameFirstRep().getFamilyAsSingleString());
	    	response.getWriter().append("First Name: " + p.getNameFirstRep().getGivenAsSingleString());
	    	response.getWriter().append("Gender: " + p.getGender());
	    	response.getWriter().append("Birthdate: " + format_dob);
	    }
	    	
	}

}
