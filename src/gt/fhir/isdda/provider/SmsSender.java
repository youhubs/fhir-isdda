package gt.fhir.isdda.provider;

import com.twilio.sdk.resource.instance.Account;
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.MessageFactory;
import com.twilio.sdk.resource.instance.Message;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;

public class SmsSender {
 
    /* Find your sid and token at twilio.com/user/account */
    public static final String ACCOUNT_SID = "ACd1d5ba95e033277969953199fa9b9dcb";
    public static final String AUTH_TOKEN = "2a0a5cd28c766c6cfad3b6dd97037a2f";
    
    private static String TO = "";
    private static String MESSAGE = "";
    
    public SmsSender(String phone, String msg) {
    	TO = phone;
    	MESSAGE = msg;
    } 
    
    public void sendMessage() throws TwilioRestException {
 
        TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);
 
        Account account = client.getAccount();
 
        MessageFactory messageFactory = account.getMessageFactory();
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("To", TO)); // Replace with a valid phone number for your account.
        params.add(new BasicNameValuePair("From", "+12812053567")); // Replace with a valid phone number for your account.
        params.add(new BasicNameValuePair("Body", MESSAGE));
        Message message = messageFactory.create(params);
        System.out.println(message.getSid());
    }
    
}