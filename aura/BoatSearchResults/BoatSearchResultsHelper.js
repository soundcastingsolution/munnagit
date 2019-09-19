({
	onSearch: function(component) {
          var boatTypId = component.get("v.boatTypeId");
		  var boatSearch = component.get("c.getBoats");
        if(boatTypId!=null){
            boatSearch.setParams({ boatTypeId :boatTypId });
        }
        else {
            
           boatSearch.setParams({ boatTypeId :""}); 
        }
        boatSearch.setCallback(this, function(response){
      var state = response.getState();
       if (state === "SUCCESS") {
             component.set("v.boats", response.getReturnValue());
       }
 });
 $A.enqueueAction(boatSearch);
	}
})