global class sch implements Schedulable {
    boolean bol;
    final string str=utilclass.TESTSTR;
    global sch(boolean bol){
       this.bol=bol; 
    }
    global void execute(SchedulableContext SC) {
      boolclass.method1(bol);
   }
}