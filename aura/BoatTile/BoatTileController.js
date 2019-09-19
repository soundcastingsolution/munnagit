({
    onBoatClick : function(component, event, helper) {
        var cmpEvent = component.getEvent("BoatSelect");
        var boat = component.get("v.boat");
        var boatId = event.getSource().get("v.name");
        cmpEvent.setParams({
            "boatId" : boatId
        });
        cmpEvent.fire();
        
        var BoatSelectedEvt = $A.get('e.c:BoatSelected');
        BoatSelectedEvt.setParams({
            "boat" : boat
        });        
        BoatSelectedEvt.fire();
        
        
        //sending Lat and Long as params in the event
        console.log(boat);
        var lat = boat.Geolocation__Latitude__s;
        var long = boat.Geolocation__Longitude__s;
        var label = boat.Name;
        var sObjectId;
        var plotMapMarkerAppEvent = $A.get("e.c:PlotMapMarker");
        plotMapMarkerAppEvent.setParams({
            "lat"   : lat,
            "long"  : long,
            "label" : label,
            "SObjectId" : boat.Id});
        plotMapMarkerAppEvent.fire();
        console.log('lat ',lat);
	
    }
})