Public with sharing class streetmap{

public static void mapping(){

for(street23__c loopstreet:(List<street23__c>)trigger.new){

loopstreet.quantity__c=2;
}
}

}