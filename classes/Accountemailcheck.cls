global class Accountemailcheck implements Messaging.InboundEmailHandler {
    
    public class values {
        
        string Result;
        string [] Values;
        
    }
 
  global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, 
                                                       Messaging.InboundEnvelope env){
 
    // Create an InboundEmailResult object for returning the result of the 
    // Apex Email Service
    Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
  
   // Add the email plain text into the local variable 
    string JsonText = email.plainTextBody;
   
    // New Task object to be created
    
    values val = (values)JSON.deserialize(JsonText,values.class);
    List<Account> acclist = new List<Account>();
    Account acc;
    for(string loopstr:val.Values) {
    acc = new Account();
    acc.id=loopstr;
    acc.Active__c='yes';
    acclist.add(acc);   
    }
    
   update acclist;
   result.success = true;
   
   // Return the result for the Apex Email Service
   return result;
  }
}