({
    doInit : function(component, event, helper) {
        helper.onInit(component,event);
    },
    onSave : function(component, event, helper) {
        var boatRev = component.get("v.boatReview");
        var boat =    component.get("v.boat");
        console.log("boat"+boat);
        console.log("boatRev"+boatRev);
        boatRev.Boat__c = boat.id;
        component.set("v.boatReviewRecord.Boat__c",component.get("v.boat.Id"));
        component.find("service").saveRecord(function(saveResult){
            console.log(saveResult);
            if(saveResult.state==="SUCCESS" || saveResult.state === "DRAFT")
            {
                
               /*var resultsToast = $A.get("e.force:showToast");
                if(resultsToast)
                {
                    resultsToast.setParams({
                        "title": "Saved",
                        "message": "Boat Review Created"
                    });
                    resultsToast.fire(); 
                }
                else
                {
                    alert('Boat Review Created');
                }*/
            }
            else if (saveResult.state === "ERROR") {
                var errMsg='';
                console.log(saveResult.state);
                for (var i = 0; i < saveResult.error.length; i++) {
                    errMsg += saveResult.error[i].message + "\n";
                }
                console.log(errMsg);
                component.set("v.recordError", errMsg);
            }
            else
            {
                //console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            }
            var boatReviewAddedEvnt=component.getEvent("BoatReviewAdded");
               boatReviewAddedEvnt.fire();
                 helper.onInit(component,event,helper);
           
        });
       
    },
    onRecordUpdated : function(component, event, helper) {
        var eventParams = event.getParams();
        if(eventParams.changeType === "CHANGED") {
            var changedFields = eventParams.changedFields;
            var saveResultsToast = $A.get("e.force:showToast");
                if(saveResultsToast!='undefined')
                {
                    saveResultsToast.setParams({
                        "title": "Saved",
                        "message": "Boat Review Saved"
                    });
                    saveResultsToast.fire(); 
                }
                else
                {
                    alert('Boat Review Saved');
                }
        }
    }
})