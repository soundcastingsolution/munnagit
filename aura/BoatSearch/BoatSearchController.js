({
	onFormSubmit : function(component, event, helper) {
		var formData = event.getParam("formData");
        component.set('v.boatTypeId',formData.boatTypeId);
        var bsrComponent = component.find("searchcmp");
        var auraMethodResult = bsrComponent.search(formData.boatTypeId);
        console.log("auraMethodResult: " + auraMethodResult);
	}
})