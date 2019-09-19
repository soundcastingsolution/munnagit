({
    init: function(component, event, helper) {
        component.set("v.enableFullDetails", $A.get("e.force:navigateToSObject"));
    },
    onFullDetails: function(component, event, helper) {
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": component.get("v.boat.Id")
        });
        navEvt.fire();
    },    
    onBoatSelected : function(component, event, helper) {
        var boatSelected = event.getParam("boat");
        component.set("v.id",boatSelected.Id);
        var service = component.find("service");
        service.reloadRecord() ;
    },
    onRecordUpdated : function(component, event, helper) {
         var boat = component.get("v.boat");
       
        console.log("onRecordUpdated called | boat: " + boat);

        //invoke a refresh on the reviews tab, calling public method refresh
        
        var BoatReviews = component.find("review");
        var lgtRev = component.find("light");
         var lgtRev1 = component.find("light1");
        console.log("BoatReviews: " + BoatReviews);
        console.log("BoatReviews light: " + lgtRev);
         console.log("BoatReviews light1: " + lgtRev1);
        if(typeof BoatReviews != 'undefined'){
            debugger;
            BoatReviews.refresh();
        }
    },
    
    onBoatReviewAdded : function(component, event, helper) {
	console.log('Event received');
	component.find("details").set("v.selTabId", "boatreviewtab");
         var BoatReviews = component.find("review");
        
        BoatReviews.refresh();
}
})