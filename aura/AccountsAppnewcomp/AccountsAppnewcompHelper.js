({
getAccounts : function(cmp) {
var action = cmp.get("c.getAccs");
action.setCallback(this, function(response) {
var state = response.getState();
if (cmp.isValid() && state === "SUCCESS") {
cmp.set("v.Accounts", response.getReturnValue());
}
// Display toast message to indicate load status
var toastEvent = $A.get("e.force:showToast");
if (state === 'SUCCESS'){
toastEvent.setParams({
"title": "Success!","message": " Your Accounts have been loaded successfully."
});
}
else {
toastEvent.setParams({
"title": "Error!",
"message": " Something has gone wrong."
});
}
toastEvent.fire();
});
$A.enqueueAction(action);
}
})