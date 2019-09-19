Public class Accountlightning {

@AuraEnabled

public static String getAccountid(Id accountId) {
    
            Account account = [SELECT id,name,BillingPostalCode FROM Account WHERE Id=:accountId];
            
           account.name = account.name+'_'+'lightning';
           
           Update account;
           
          return account.id;           
       
}

}