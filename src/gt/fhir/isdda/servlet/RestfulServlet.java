package gt.fhir.isdda.servlet;

import java.util.ArrayList;
import java.util.List;

import gt.fhir.isdda.provider.PatientResourceProvider;
import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.narrative.DefaultThymeleafNarrativeGenerator;
import ca.uhn.fhir.narrative.INarrativeGenerator;
import ca.uhn.fhir.rest.server.IResourceProvider;
import ca.uhn.fhir.rest.server.RestfulServer;

public class RestfulServlet extends RestfulServer {

	private static final long serialVersionUID = 1L;

	public RestfulServlet() {
		super(FhirContext.forDstu2()); // Support DSTU2
	}

	@Override
	public void initialize() {
	
		List<IResourceProvider> providers = new ArrayList<IResourceProvider>();
		providers.add((IResourceProvider) new PatientResourceProvider());
		// can add more provider here ...
		setResourceProviders(providers);

		INarrativeGenerator narrativeGen = new DefaultThymeleafNarrativeGenerator();
		getFhirContext().setNarrativeGenerator(narrativeGen);
		setUseBrowserFriendlyContentTypes(true);
	}

}
