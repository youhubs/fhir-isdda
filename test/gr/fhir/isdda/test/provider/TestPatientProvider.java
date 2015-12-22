package gr.fhir.isdda.test.provider;

import static org.junit.Assert.*;
import java.util.List;
import gt.fhir.isdda.provider.PatientResourceProvider;
import org.junit.Test;
import ca.uhn.fhir.model.dstu2.resource.Patient;

public class TestPatientProvider {
	PatientResourceProvider prp = new PatientResourceProvider();

	@Test
	public void testGetPatientByFamilyName() {
		String lastName = "FRANKLIN";
		List<Patient> patients = prp.getPatientByFamilyName(lastName);
		Patient patient = null;
		for (int i = 0; i < patients.size(); i++) {
			patient = patients.get(i);
			
			System.out.println("#######"+lastName + "-, First: " + patient.getName().get(0) + "-, BirthDate: " + patient.getBirthDate());
			System.out.println("#######"+lastName + "-, Address: " + patient.getAddress() + "-, Name: " + patient.getNameFirstRep());
		}
		assertEquals(10, patients.size());
	}

	@Test
	public void testGetPatientByGivenName() {
		List<Patient> result = prp.getPatientByGivenName("Clinton");
		assertEquals(10, result.size());
	}
	
}
