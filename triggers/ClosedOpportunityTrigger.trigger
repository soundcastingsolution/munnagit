trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    if(Trigger.isafter && (Trigger.isinsert || Trigger.isupdate)){
        oppTriggerHelper trigHelper = new oppTriggerHelper();
        trigHelper.crtTask(Trigger.new);
    }
}