package gt.fhir.isdda.test.manager;

import static org.junit.Assert.*;
import gt.fhir.isdda.manager.PatientResourceManager;

import org.junit.Test;

import ca.uhn.fhir.model.api.Bundle;
import ca.uhn.fhir.model.dstu2.resource.Patient;
import ca.uhn.fhir.rest.client.IGenericClient;

public class TestGenericManager {
	IGenericClient mgr = null;
	
/*	@Test
	public void test() {
		
		mgr = PatientResourceManager.getClient();
		
		Bundle result = mgr.search()
			      .forResource(Patient.class)
			      .where(Patient.FAMILY.matches().value("FRANKLIN"))
			      .execute();
		
		//System.out.println("size is: " + result.size());
		
		assertEquals(2, result.size());		
	}*/

}
