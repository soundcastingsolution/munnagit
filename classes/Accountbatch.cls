global class Accountbatch implements Database.Batchable<sObject>{

   global final String Query;
   global final String Entity;
   global final String Field;
   global final String Value;

   global Accountbatch (String q){

      Query=q;
   }

   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<sObject> scope){
     List<account> acclist = new  List<account>();
     for(Account acc : (List<Account>)scope){
      Account updacc = new Account();
      updacc.id = acc.id;
      updacc.updated_by_batch__c ='Yes';
      acclist.add(updacc);
      DateTime sampleDateGMT = system.now() ; 
      
                  //calculating spain difference in minutes from GMT(0)
         TimeZone tz = UserInfo.getTimeZone();
                    // During daylight saving time for the spain time zone
        integer offsetToUserTimeZone = tz.getOffset(sampleDateGMT );
          System.debug('GMT Offset real : ' + offsetToUserTimeZone );
                  System.debug('GMT Offset: ' + ( offsetToUserTimeZone / (1000 * 60 *60) )+ ' (hours) ');
                  datetime sampleDate = sampleDateGMT.addMinutes(offsetToUserTimeZone / (1000 * 60));
                  System.debug('correctedDateTime: ' + sampleDate );
      
     }
     update acclist;
    }

   global void finish(Database.BatchableContext BC){
   
   future.futuremethod();
   }
}