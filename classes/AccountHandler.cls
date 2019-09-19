global  class AccountHandler{
    webservice static void insertNewAccount(String na){
        Account Ac = new Account();
        Ac.name = na;
        try{
            insert Ac;
            
        }
        catch(exception e){
            system.debug('@@@Catch@@'+e.getMessage());
           
        }
    
    }
}