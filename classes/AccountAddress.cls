Public Class AccountAddress{
    public void copyAddress(List<Account> lstAcc){
        if(lstAcc.size()>0){
            for(Account acc:lstAcc){
                if(acc.Match_Billing_Address__c && (acc.BillingPostalCode != '' || acc.BillingPostalCode != null)){
                     acc.ShippingPostalCode =  acc.BillingPostalCode;
                     //so comments 
                     //these changes 
                }
            }    
        }
    } 
}