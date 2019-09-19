({
    doInit : function(component, event, helper) {
        
		var action = component.get("c.getAccountid");
        
        action.setParams({
            accountId : component.get("v.recordId")
        });
        
        action.setCallback(this, function(response) {
            
            //var accid = response.getReturnValue();
            
   
        });
       
        $A.enqueueAction(action);
		$A.get("e.force:closeQuickAction").fire();
		         
                
    var navg = $A.get("e.force:navigateToSObject");
    navg.setParams({
      "recordId":component.get("v.recordId"),
      "slideDevName": "detail"

      
    });
    navg.fire();
            
    }  
})