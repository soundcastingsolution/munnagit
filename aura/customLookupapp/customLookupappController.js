({
	handleClick : function(component, event, helper) {
		var rec = component.get('v.selectedLookUpRecord');
        component.set('v.showError',false);
        if(Object.keys(rec).length===0 ){
            alert('Empty');
           component.set('v.showError',true);
        }
        else {
            alert(JSON.stringify(rec));
        }
	}
})