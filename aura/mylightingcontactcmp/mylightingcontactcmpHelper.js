({
getMyContacts : function(cmp) {
// Load all contact data
var action = cmp.get("c.getContacts");
action.setCallback(this, function(response){
var state = response.getState();
if (state === "SUCCESS") {
cmp.set("v.contacts", response.getReturnValue());
}
});
$A.enqueueAction(action);
}
})