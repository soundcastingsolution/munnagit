public class batchexecution {

public string datepic{get;set;}

public list<account> acclist{get;set;}
public datetime disdate{get;set;}

public batchexecution() {

acclist = new list<account>();

acclist = [select id,name,updated_by_batch__c,lastmodifieddate from account limit 1];

}
public void Runbatch() {


disdate = date.valueof(datepic);
system.debug('@@@@@@@@@@disdate'+disdate);
for(account accloop:[select id,name,updated_by_batch__c,lastmodifieddate from account where lastmodifieddate<=:disdate]) {

acclist.add(accloop);
}



}

}