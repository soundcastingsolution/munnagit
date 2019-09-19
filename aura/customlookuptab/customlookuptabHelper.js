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
	
})