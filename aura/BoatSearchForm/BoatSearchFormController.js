({
    doInit : function(component, event, helper){

        helper.loadBoatTypes(component);
    },

    handleChange : function(component, event, helper){
        console.log(component.find("boatTypes").get("v.value"));
        component.set("v.selectedType", component.find("boatTypes").get("v.value"));
    },

    search : function(component, event, helper){
        var selectedType = component.get("v.selectedType");
        var formSubmit = component.getEvent("FormSubmit");
        console.log('@@@@@@'+formSubmit);
        console.log('@@@@@@'+selectedType);
        formSubmit.setParams({"formData": 
                            {"boatTypeId" : selectedType }
        });
        formSubmit.fire();
        
    },
    
    newBoat:function(component, event, helper){
      
     var boatTypeId = component.get("v.selectedType");
     //var boatTypeId=component.find("boatTypes").get("v.value")

       var createNewBoat = $A.get("e.force:createRecord");
        createNewBoat.setParams({
            "entityApiName": "Boat__c",
        })
        if(! boatTypeId==""){
            createNewBoat.setParams({
                "defaultFieldValues": {'BoatType__c': boatTypeId}
           })
        }
        createNewBoat.fire();        
        
    },
    
    onFormSubmit : function(component, event, helper){
        var boatTypeId = component.get("v.selectedType");
        
         var formSubmit = component.getEvent("FormSubmit");
        formSubmit.setParams({"formData":
                            {"boatTypeId" : boatTypeId}
        });
        formSubmit.fire();
    },
    
    //more handlers here
})