trigger test on Vehicle__c (after insert,after update) {
set<id> veclist = new set<id>(); 
for(Vehicle__c vec:trigger.new){
system.debug('@@@'+vec.account__r.name+'***'+vec.account__r.recordtype.developername);
veclist.add(vec.id);
}
for(Vehicle__c vecloop:[select id,Account__r.name,Account__r.recordtype.developername from Vehicle__c where id in: trigger.newmap.keyset()]) {

system.debug('@@@'+vecloop.account__r.name+'***'+vecloop.account__r.recordtype.developername);

}

}