/**
 * @name orderTrigger
 * @description
**/
// Fire the trigger after updating 
trigger OrderTrigger on Order (after update) {
   
   
   OrderHelper.AfterUpdate(Trigger.new, Trigger.old);
   
    

}