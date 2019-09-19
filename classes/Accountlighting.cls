public with sharing class Accountlighting{
@AuraEnabled
public static List<Account> getAccs() {
List<Account> Accs =
[SELECT Id,Name FROM Account];
//Add isAccessible() check
return Accs;
}
@AuraEnabled

public static List<Account> getAccPrimary() {
    
List<Account> Accsjp =
[SELECT Id,Name FROM Account];
//Add isAccessible() check
return Accsjp;
}
}