package gt.fhir.isdda.provider;

import java.util.ArrayList;
import java.util.List;
import gt.fhir.isdda.manager.PatientResourceManager;
import ca.uhn.fhir.model.api.Bundle;
import ca.uhn.fhir.model.api.BundleEntry;
import ca.uhn.fhir.model.api.IResource;
import ca.uhn.fhir.model.dstu2.resource.Patient;
import ca.uhn.fhir.rest.client.IGenericClient;

public class PatientResourceProvider {

	IGenericClient mgr = null;
	List<Patient> patients = getPatientByFamilyName("");
	
	public List<Patient> getPatients(String given, String family, String birthdate, String address) {
		
		boolean flag1=false, flag2=false, flag3=false, flag4=false;
		if (given != null && !"".equals(given)) flag1 = true;
		if (family != null && !"".equals(family)) flag2 = true;
		if (birthdate != null && !"".equals(birthdate)) flag3 = true;
		if (address != null && !"".equals(address)) flag4 = true;
		
		if (!flag1 && !flag2 && !flag3 && !flag4) {
			return patients;
		} else {			
			if (flag1 && !flag2 && !flag3 && !flag4) patients = getPatientByGivenName(given);
			if (flag2 && !flag1 && !flag3 && !flag4) patients = getPatientByFamilyName(family);
			if (flag3 && !flag1 && !flag2 && !flag4) patients = getPatientByBirthdate(birthdate);
			if (flag4 && !flag1 && !flag2 && !flag3) patients = getPatientByAddress(address);
			if (flag1 && flag2) patients = getPatientByName(given, family);
			
			if (flag1 && flag2 && flag3 && flag4) {
				
				mgr = PatientResourceManager.getClient();

				ca.uhn.fhir.model.api.Bundle result = mgr.search()
						.forResource(Patient.class)
						.where(Patient.FAMILY.matches().value(family))
						.and(Patient.GIVEN.matches().value(given))
						.and(Patient.BIRTHDATE.exactly().day(birthdate))
						.and(Patient.ADDRESS.matches().values(address))
						.execute();
				
				patients = this.processPatientBundle(result);
			}
		}

		return patients;
	} 
	
	public List<Patient> getPatients(String given, String family, String address) {
		
		boolean flag1=false, flag2=false, flag3=false;
		if (given != null && !"".equals(given)) flag1 = true;
		if (family != null && !"".equals(family)) flag2 = true;
		if (address != null && !"".equals(address)) flag3 = true;
		
		if (!flag1 && !flag2 && !flag3) {
			return patients;
		} else {			
			if (flag1 && !flag2 && !flag3) patients = getPatientByGivenName(given);
			if (flag2 && !flag1 && !flag3) patients = getPatientByFamilyName(family);
			if (flag3 && !flag1 && !flag2) patients = getPatientByAddress(address);
			if (flag1 && flag2) patients = getPatientByName(given, family);
			
			if (flag1 && flag2 && flag3 && flag3) {
				
				mgr = PatientResourceManager.getClient();

				ca.uhn.fhir.model.api.Bundle result = mgr.search()
						.forResource(Patient.class)
						.where(Patient.FAMILY.matches().value(family))
						.and(Patient.GIVEN.matches().value(given))
						.and(Patient.ADDRESS.matches().values(address))
						.execute();
				
				patients = this.processPatientBundle(result);
			}
		}

		return patients;
	} 
	
	// Perform a search by patient Given Name
	public List<Patient> getPatientByGivenName(String given) {

		mgr = PatientResourceManager.getClient();

		ca.uhn.fhir.model.api.Bundle result = mgr.search()
				.forResource(Patient.class)
				.where(Patient.GIVEN.matches().value(given)).execute();
		
		return this.processPatientBundle(result);
	}
	
	// Perform a search by patient Family Name
	public List<Patient> getPatientByFamilyName(String family) {

		mgr = PatientResourceManager.getClient();

		ca.uhn.fhir.model.api.Bundle result = mgr.search()
				.forResource(Patient.class)
				.where(Patient.FAMILY.matches().value(family)).execute();

		return this.processPatientBundle(result);
	}
	
	// Perform a search by patient Name
	public List<Patient> getPatientByName(String given, String family) {

		mgr = PatientResourceManager.getClient();

		ca.uhn.fhir.model.api.Bundle result = mgr.search()
				.forResource(Patient.class)
				.where(Patient.FAMILY.matches().value(family))
				.and(Patient.GIVEN.matches().value(given))
				.execute();
		
		return this.processPatientBundle(result);
	}
	
	public Patient getPatientInfo(String given, String family, String pid) {
		
		List<Patient> patients = getPatientByName(given, family);
		
		int num = patients.size();
		Patient patient = new Patient();
		for (int i=0; i<num; i++) {
			Patient p = patients.get(i);
			if (p.getId().getIdPart().equals(pid)) {
				patient = p;
			}
		}
		
		return patient;
	}
	
	// Perform a search by patient birthday
	public List<Patient> getPatientByBirthdate(String birthdate) {

		mgr = PatientResourceManager.getClient();

		ca.uhn.fhir.model.api.Bundle result = mgr.search()
				.forResource(Patient.class)
				.where(Patient.BIRTHDATE.exactly().day(birthdate))
				.execute();

		return this.processPatientBundle(result);
	}
	
	// Perform a search by patient address
	public List<Patient> getPatientByAddress(String address) {

		mgr = PatientResourceManager.getClient();

		ca.uhn.fhir.model.api.Bundle result = mgr.search()
				.forResource(Patient.class)
				.where(Patient.ADDRESS.matches().values(address))
				.execute();

		return this.processPatientBundle(result);
	}
		
	public List<Patient> processPatientBundle(Bundle bundle) {
		
		List<Patient> patients = new ArrayList<Patient>();
		List<IResource> theResources = new ArrayList<IResource>();
		
			for (BundleEntry entry : bundle.getEntries()) {
				theResources.add(entry.getResource());
			}
			for (IResource resource : theResources) {
				if (resource instanceof Patient) {
					patients.add((Patient) resource);
				}
			}

		return patients;
	}

}