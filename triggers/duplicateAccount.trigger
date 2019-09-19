trigger duplicateAccount on Lead (after insert, after update) {

List<Lead> existingLeads=new List<Lead>();
List<Account> existingAccounts=new List<Account>();
List<Contact> existingContacts=new List<Contact>();
List<DupeLead__c> duplicateLeads=new List<DupeLead__c>();
DupeLead__c dupelead=new DupeLead__c();
List<Contact> c=new List<Contact>();
Boolean conv;

List<String> emailcoll=new List<String>();

    
existingLeads=[select id,lastName, IsConverted,email from Lead where id IN:Trigger.newMap.keySet()];
for(Lead l:existingLeads){

if(l.IsConverted) {
conv = true;
}
emailcoll.add(l.email);

}
existingContacts=[select Name,email from contact where email IN:emailcoll];
system.debug('#####'+existingContacts);
if(existingContacts.size()!=0 ){
for(contact cc:existingContacts){
dupelead.email__c=cc.email;
dupelead.Name=cc.Name;
duplicateLeads.add(dupelead);
  }
}
if(conv!=true){
    try{
        insert duplicateLeads;
        System.debug('successful');
    }
    catch(Exception e){
        System.debug('insertion failed' + e.getMessage());
    }
  }
}