({
doInit : function(component, event, helper) {
// Retrieve contacts during component initialization
helper.getMyContacts(component);
},
onSelectChange : function(component, event, helper) {
// Print out the selected value
var selected = component.find("opt").get("v.value");
console.log(selected);
}
})