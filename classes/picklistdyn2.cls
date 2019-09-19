public class picklistdyn2{
public list<Accwrap> accwraplist{get;set;}
public List<accwrap> dislist{get;set;}
public List<accwrap> listdata{get;set;}
public picklistdyn2(){

accwraplist = new list<Accwrap>();
for(Account accloop:[select id,name from account limit 3]){
accwrap accw = new accwrap(accloop);

accwraplist.add(accw);

}
//listdata = new List<accwrap>();

}


public pagereference save(){

dislist = new List<accwrap>();
dislist = accwraplist;
    

return null;

}
public List<SelectOption> getindustries()
{
  List<SelectOption> options = new List<SelectOption>();
        
   Schema.DescribeFieldResult fieldResult =
  Account.Industry.getDescribe();
   List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
   for( Schema.PicklistEntry f : ple)
   {
      options.add(new SelectOption(f.getLabel(), f.getValue()));
   }       
   return options;
}

public class accwrap {

public Account acc{get;set;}
public string indusselect{get;set;}

public accwrap(Account accparam){
    
    acc= new Account();
    acc=accparam;
    
}
    
    
    
}

}