trigger URLlink on Account (before insert,before update) {

id rid =[SELECT Id,name,developername from report limit 1].id; 

for(Account acc:trigger.new){

acc.Url__c = System.URL.getSalesforceBaseUrl().toExternalForm()+'/'+rid;

}

}