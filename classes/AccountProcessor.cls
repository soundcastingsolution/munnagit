public class AccountProcessor{

@future
public static void countContacts(set<ID> accids){
Account updacc; 
List<Account> acclist = new List<Account>();
AggregateResult[] aggr = [Select Accountid,count(id)concount from Contact where Accountid=:accids group by Accountid ];

for(AggregateResult loopin:aggr){
updacc = new Account(); 
updacc.id=(id)loopin.get('Accountid');
updacc.Number_of_Contacts__c=(integer)loopin.get('concount');  
acclist.add(updacc);    
    
}   

update Acclist; 
}

}