({
   init: function (cmp, event, helper) {
        cmp.set('v.columns', [
            { label: 'Contact Name', fieldName: 'Name', type: 'text'},
            { label: 'Phone', fieldName: 'Phone', type: 'phone' },
            { label: 'Email',fieldName: 'Email', type: 'email'},
            //AccountName
        ]);
        cmp.set('v.msg','');
         //Picklist
         // get the fields API name and pass it to helper function  
        var controllingFieldAPI = cmp.get("v.controllingFieldAPI");
        var dependingFieldAPI = cmp.get("v.dependingFieldAPI");
        var objDetails = cmp.get("v.objDetail");
        // call the helper function
        helper.fetchPicklistValues(cmp,objDetails,controllingFieldAPI, dependingFieldAPI);
         //Picklist
        helper.getData(cmp);
    },
    
    updateSelectedText: function (cmp, event) {
        var selectedRows = event.getParam('selectedRows');
        cmp.set('v.selectedRowsCount', selectedRows.length);
        cmp.set('v.selectedRows', selectedRows);
		console.log('@@@@@@rows4'+JSON.stringify(selectedRows));
    },
    
     clickAdd: function (cmp, event,helper) {
		 var bol = true;
         cmp.set('v.error','');
         
          var allValid = cmp.find('inpfield').reduce(function (validSoFar, inputCmp) {
            inputCmp.focus();
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
         
          if (!allValid) {
            bol=false;
            }
            
                        
		if(cmp.get('v.selectedRows').length==0){
			
			bol = false;
            cmp.set('v.error','Please select the rows');
           
            
		}
        if(bol) {
            alert(JSON.stringify(cmp.get('v.selectedRows')));
            //helper.updData(cmp);
           
        }
          
		
	},
    
    close:function(cmp,event) {
                $A.get("e.force:closeQuickAction").fire();
            },
      onControllerFieldChange: function(cmp, event, helper) {     
        var controllerValueKey = event.getSource().get("v.value"); // get selected controller field value
        var depnedentFieldMap = cmp.get("v.depnedentFieldMap");
        
        if (controllerValueKey != '') {
            var ListOfDependentFields = depnedentFieldMap[controllerValueKey];
            
            if(ListOfDependentFields.length > 0){
                cmp.set("v.bDisabledDependentFld" , false);  
                helper.fetchDepValues(cmp, ListOfDependentFields);    
            }else{
                cmp.set("v.bDisabledDependentFld" , true); 
                cmp.set("v.listDependingValues", ['--- None ---']);
                cmp.set("v.Depselected",'');
                
            }  
            
        } else {
            cmp.set("v.listDependingValues", ['--- None ---']);
            cmp.set("v.bDisabledDependentFld" , true);
        }
        console.log('@@@onchange'+cmp.get('v.bDisabledDependentFld'));
    },
})