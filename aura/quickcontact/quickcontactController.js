({
    createcon: function(component, event, helper) {
		var createcon = $A.get("e.force:createRecord");
       /*
       
       recordTypeId
       defaultFieldValues
       */ 
       createcon.setParams({
            "entityApiName":"Contact"
            
		});
		createcon.fire();
        $A.get("e.force:closeQuickAction").fire();
           
    },
    cancel:function(component, event, helper) {
        
        $A.get("e.force:closeQuickAction").fire(); 
        
    }
   
})