public class TeamMailhandler {
List<AccountTeamMember> acclist = new List<AccountTeamMember>();
List<opportunity> opplist = new  List<opportunity>();
list<id> accids = new list<id>();
list<Messaging.SingleEmailMessage> mails = new list<Messaging.SingleEmailMessage>();
public void TeamMailMethod(set<Id> oppidlist){
opplist = [select id,name,Accountid from opportunity where id IN:oppidlist];
for(opportunity opp:opplist){
  accids.add(opp.Accountid);
}
acclist = [select AccountId,UserId,user.Email,user.name from AccountTeamMember where AccountId IN:accids];
if(acclist.size()!=0){
for(opportunity oppl:opplist){
  for(AccountTeamMember ATM:acclist ){
      if(oppl.Accountid==ATM.AccountId){
          Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
          List<string> eid = new List<string>();
          eid.add(ATM.user.Email);
          mail.setToAddresses(eid);
          mail.setSubject('Oppurtunity'+oppl.name+'is created');
          String body ='The opportunity name is'+oppl.name+'and the email id is '+ATM.user.name;
          mail.setHtmlBody(body);
          mails.add(mail);
     }
   }
 }
}
Messaging.sendEmail(mails);
 }
}