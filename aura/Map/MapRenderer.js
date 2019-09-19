({
    rerender: function (component, helper) {

        var nodes = this.superRerender();

        // If Leaflet library is not yet loaded, we can't draw the map: return
        if (!window.L) return nodes;

        var map = component.get("v.location");
        console.log('@@@map'+map);
        
        // Draw the map if it hasn't been drawn yet
        if (!map) {
            var mapElement = component.find("map").getElement();
            
            var mapcontent = L.map(mapElement, {zoomControl: false,tap: false});
                component.set("v.location", mapcontent);
            }
        
        return nodes;

    }
})