public with sharing class opportunityTriggerHandlerClass { 
public static void countofOliItemsMethod(List<OpportunityLineItem> oliList){ 
Set<Id> oppIdSet = new Set<Id>(); Set<Id> accIdSet = new Set<Id>(); 
List<Account> accToUpdate = new List<Account>(); 
for(OpportunityLineItem oli: oliList){ 
oppIdSet.add(oli.OpportunityId); System.debug('Opportunity Id fetch' + oppIdSet) ; 
} 
for(Opportunity oppty : [SELECT ID,AccountId FROM Opportunity WHERE Id IN: oppIdSet]){ 
accIdSet.add(oppty.AccountId) ; System.debug('Oppty Acc Id is : '+ accIdSet); 
} List<AggregateResult> aggrs = [SELECT Opportunity.AccountId accid, count(Id)oli FROM OpportunityLineItem where Opportunityid IN: oppIdSet GROUP BY Opportunity.AccountId] ; 
System.debug('aggrs : '+ aggrs);
 if(aggrs.size() > 0){ 
 for(AggregateResult aggr : aggrs){ 
 system.debug('@@@@@@accid'+aggr.get('Accid'));
  Account accObj = new Account(); 
 accObj.Id = (id)aggr.get('accid'); 
 accObj.Count_Of_Opportunity_Line_Items__c =(decimal)aggr.get('oli') ; 
 accToUpdate.add(accObj); } update accToUpdate; } 
 }
 
 }