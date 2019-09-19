({
    getData : function(cmp) {
        var action = cmp.get('c.getContacts');
        //action.setParams({ Id : cmp.get("v.recordId") });
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               /*var rows = response.getReturnValue();
            for (var i = 0; i < rows.length; i++) {
                var row = rows[i];
                if (row.Account) row.AccountName = row.Account.Name;
            }
                cmp.set('v.data', rows);*/
                cmp.set('v.data',response.getReturnValue());

                if(response.getReturnValue()!=null && response.getReturnValue().length===0){
                    
                    cmp.set('v.msg','No records to display');
                }
                
                
               
            } else if (state === "ERROR") {
                var errors = response.getError();
                cmp.set('v.msg','An Error has occured while fetching records.Please contact the Admin');
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    },
    updData:function(cmp){
        
        var action = cmp.get('c.updContacts');
        action.setParams({ updlist : cmp.get('v.selectedRows') });
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               
               cmp.find('notifLib').showToast({
                "title": "Success!",
                "message": "Processed!",
                 "variant": "success"
                
            });
			
			 $A.get("e.force:closeQuickAction").fire();
               
            } else if (state === "ERROR") {
                 
				 cmp.find('notifLib').showToast({
                "title": "Error!",
                "message": "Failed!",
                 "variant": "error"
                
            });
				 $A.get("e.force:closeQuickAction").fire();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
        
    },
    fetchPicklistValues: function(cmp,objDetails,controllerField, dependentField) {
        // call the server side function  
        var action = cmp.get("c.getDependentMap");
        // pass paramerters [object definition , contrller field name ,dependent field name] -
        // to server side function 
        action.setParams({
            'objDetail' : objDetails,
            'contrfieldApiName': controllerField,
            'depfieldApiName': dependentField 
        });
        //set callback   
        action.setCallback(this, function(response) {
            console.log(response.getReturnValue());
            if (response.getState() == "SUCCESS") {
                //store the return response from server (map<string,List<string>>)  
                var StoreResponse = response.getReturnValue();
                
                // once set #StoreResponse to depnedentFieldMap attribute 
                cmp.set("v.depnedentFieldMap",StoreResponse);
                
                // create a empty array for store map keys(@@--->which is controller picklist values) 
                var listOfkeys = []; // for store all map keys (controller picklist values)
                var ControllerField = []; // for store controller picklist value to set on lightning:select. 
                
                // play a for loop on Return map 
                // and fill the all map key on listOfkeys variable.
                for (var singlekey in StoreResponse) {
                    listOfkeys.push(singlekey);
                }
                
                //set the controller field value for lightning:select
                if (listOfkeys != undefined && listOfkeys.length > 0) {
                    ControllerField.push('--- None ---');
                }
                
                for (var i = 0; i < listOfkeys.length; i++) {
                    ControllerField.push(listOfkeys[i]);
                }  
                
                cmp.set("v.listControllingValues", ControllerField);
            }else{
                alert('Something went wrong..');
            }
        });
        $A.enqueueAction(action);
    },
    
    fetchDepValues: function(cmp, ListOfDependentFields) {
        // create a empty array var for store dependent picklist values for controller field  
        var dependentFields = [];
        dependentFields.push('--- None ---');
        for (var i = 0; i < ListOfDependentFields.length; i++) {
            dependentFields.push(ListOfDependentFields[i]);
        }
        // set the dependentFields variable values to store(dependent picklist field) on lightning:select
        cmp.set("v.listDependingValues", dependentFields);
        
    },
})