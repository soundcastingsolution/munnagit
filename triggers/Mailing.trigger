trigger Mailing on DupeLead__c (after insert,after update) {
list<Messaging.SingleEmailMessage> finalm = new list<Messaging.SingleEmailMessage>();

for( DupeLead__c d:Trigger.new) {
Messaging.SingleEmailMessage m = 
      new Messaging.SingleEmailMessage();
      
      m.setToAddresses(new String[] {'tadakaluru.saisekhar@accenture.com'});
      m.setSubject('duplicate contact');
      String body = 'The name of the duplicate contact is '+d.name+'and the email associated with this contact is '+d.email__c;
      m.setHtmlBody(body);
      Blob b = Blob.toPdf(body);
      
      Messaging.EmailFileAttachment att = new Messaging.EmailFileAttachment();
      att.setFileName('attachment.pdf');
      att.setBody(b);
      m.setFileAttachments(new Messaging.EmailFileAttachment[]{att});
      
      finalm.add(m);
  }

Messaging.sendEmail(finalm);

    // 
    Account a= new Account();
    a.Name = 'abc';
    insert a;
    


}