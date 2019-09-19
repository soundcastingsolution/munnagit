({
    init: function (cmp, event, helper) {
        cmp.set('v.columns', [
            { label: 'Contact Name', fieldName: 'Name', type: 'text'},
            { label: 'Phone', fieldName: 'Phone', type: 'phone' },
            { label: 'Email',fieldName: 'Email', type: 'email'},
            //AccountName
        ]);
            cmp.set('v.msg','');
            cmp.set('v.showError',false);
            cmp.set('v.showError2',false);
            cmp.set('v.data',[]);
            cmp.set('v.filter',null);
            helper.getData(cmp);
            
            },
   updateSelectedText: function (cmp, event) {
            var selectedRows = event.getParam('selectedRows');
            cmp.set('v.selectedRowsCount', selectedRows.length);
            cmp.set('v.selectedRows', selectedRows);
            console.log('@@@@@@rows4'+JSON.stringify(selectedRows));
            },
            
  handleClick : function(cmp, event, helper) {
            var rec = cmp.get('v.selectedLookUpRecord');
            var bol = true;
            cmp.set('v.showError',false);
            cmp.set('v.showError2',false);
            if(Object.keys(rec).length===0 ){
            alert('Empty');
            cmp.set('v.showError',true);
            bol=false;
            }
            
            if(cmp.get('v.selectedRows').length==0){
             cmp.set('v.showError2',true);
            bol=false;
            }
            if(bol){
              //process
            }
            
    },
            search:function(cmp, event, helper) {
             var rec = cmp.get('v.selectedLookUpRecord');
            var bol = true;
            cmp.set('v.showError',false);
            cmp.set('v.showError2',false);
            if(Object.keys(rec).length===0 ){
            alert('Empty');
            cmp.set('v.showError',true);
            bol=false;
            }
            if(bol){
              cmp.set('v.filter',rec.Name);
            }
               
            }
})