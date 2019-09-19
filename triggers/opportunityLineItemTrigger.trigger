trigger opportunityLineItemTrigger on OpportunityLineItem (after insert,after update,after delete) { 
if(trigger.isAfter){ 
if(trigger.isInsert){ 
opportunityTriggerHandlerClass.countofOliItemsMethod(trigger.new); 
} 
if(trigger.isUpdate){ 
opportunityTriggerHandlerClass.countofOliItemsMethod(trigger.new); 
} if(trigger.isDelete){ 
opportunityTriggerHandlerClass.countofOliItemsMethod(trigger.old); 
} 
} 
}