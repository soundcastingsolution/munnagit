Public class acccon {

public List<Account> getaccconlist(){
//some comments
return [select id,name,(select id,name from contacts limit 1) from Account];

}

}