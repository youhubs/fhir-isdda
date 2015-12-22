package gt.fhir.isdda.manager;

import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.rest.client.IGenericClient;
import ca.uhn.fhir.rest.client.api.IRestfulClient;
import ca.uhn.fhir.rest.server.EncodingEnum;

public abstract class PatientResourceManager implements IGenericClient {

	private static IGenericClient mgr = null;
	private static IRestfulClient rmgr = null;
	final static String serverBase = "http://polaris.i3l.gatech.edu:8080/gt-fhir-webapp/base";
	
	private PatientResourceManager() { }

	public static IGenericClient getClient() {
		
		if (mgr == null) {
			FhirContext ctx = FhirContext.forDstu2();
			mgr = ctx.newRestfulGenericClient(serverBase);
			mgr.setEncoding(EncodingEnum.JSON);
			mgr.setPrettyPrint(true);
		}
		
		return mgr;
	}
	
	public static IRestfulClient getRestfulClient() {
		
		if (rmgr  == null) {
			FhirContext ctx = FhirContext.forDstu2();
			rmgr = ctx.newRestfulClient(IRestfulClient.class, serverBase);
		}
		
		return rmgr;
	}

}
