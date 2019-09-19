@istest
public class AccountProcessorTest{

public static testmethod void AccountProcessormethod(){
Account insacc;
List<Account> acclist = new List<Account>();
contact con;
List<contact> conlist = new List<contact>();
set<id> accids = new set<id>(); 
for(integer i=0;i<2;i++) {
insacc = new Account();
insacc.name = 'testacc'+i;
acclist.add(insacc);

}
insert acclist;

for(Account acc:acclist){

accids.add(acc.id);
con = new contact();
con.accountid=acc.id;
con.lastname=acc.name+'con';    
conlist.add(con);   
}
insert conlist;

test.starttest();
AccountProcessor.countContacts(accids);
test.stoptest();
    
  }  
}