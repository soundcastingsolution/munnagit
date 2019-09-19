({
	headselected : function(component, event, helper) {
        alert('Hi17');
        alert(event.currentTarget.dataset.value);
        
		var hsel = component.get("v.headselect");
        if(event.currentTarget.dataset.value=="head"){
        if(hsel){
          
          component.set("v.headselect",false);
            
        }
        
        else {
           
            component.set("v.headselect",true);
            
        }
      }
	  if(event.currentTarget.dataset.value=="chest"){
        if(hsel){
          
          component.set("v.chestselect",false);
            
        }
        
        else {
           
            component.set("v.chestselect",true);
            
        }
      }
	  
	}
})