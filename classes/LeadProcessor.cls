global class LeadProcessor implements Database.Batchable<sObject>{

 global string query;
   

   global LeadProcessor(string querystr){
    
    query = querystr;
      
   }

   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<sObject> scope){
     for(sobject s : scope){
     s.put('LeadSource','Dreamforce'); 
     }
     update scope;
    }

   global void finish(Database.BatchableContext BC){
   }
}