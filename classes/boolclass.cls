public class boolclass {
    //public static boolean bol=false;
    public static string method1(boolean bol){
      final string str = utilclass.TESTSTR;
        final string str2=system.label.str;
        if(bol){
            
            Vehicle__c vv = new Vehicle__c();
            vv.name='testdebugsch';
            insert vv;
            return 'some text';
            
        }
        
        return null;
        
    }
}