global class scheduledAccount implements Schedulable {
   global void execute(SchedulableContext SC) {
      database.executebatch(new Accountbatch('select id from account limit 2'),5); 
   }
}