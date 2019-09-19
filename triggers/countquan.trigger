trigger countquan on street23__c (before insert,before update) {

streetmap.mapping();

}