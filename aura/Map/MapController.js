({
    jsLoaded: function(component) {
        
        component.set("v.jsLoaded", true);
    },
    
    onPlotMapMarker : function(component, event, helper) {
		var lat = event.getParam("lat");
		var long = event.getParam("long");
        var name = event.getParam("label");
        var loc = component.get("v.location");
        var mapcontent = null;
        var map = loc.setView([lat,long],14);    
        //mapcontent = component.find("map").getElement();
        //loc = L.map(mapcontent, {zoomControl: false}).setView([lat,long], 14);
            L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}', {
		    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
		}).addTo(map);
		
		L.marker([lat, long]).addTo(map)
		    .bindPopup(name);
		    
		console.log("lat"+lat);
		//component.set("v.location", {'lat' : lat, 'long' : long}); 
     },
})