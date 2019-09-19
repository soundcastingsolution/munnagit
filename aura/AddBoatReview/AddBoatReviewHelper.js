({
    onInit : function(component,event) {
        component.find("service").getNewRecord(
            "BoatReview__c", // sObject type (entityAPIName)
            null,      // recordTypeId
            false,     // skip cache?
            $A.getCallback(function() {
                var rec = component.get("v.boatReview");
                var recv = component.get("v.boatReviewRecord");
                var error = component.get("v.recordError");
                var boat=component.get("v.boat");
                console.log("boatobject"+boat);
                if(error || (rec === null)) {
                    //console.log("Error initializing record template: " + error);
                }
                else {
                      rec.Boat__c = boat.id;
                      recv.Boat__c = boat.id;
                      component.set("v.boatReviewRecord.Boat__c",recv);
                        component.set("v.boatReview.Boat__c",rec);
                    }                
            })
        );
    }
})