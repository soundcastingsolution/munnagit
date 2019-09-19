public class onchangeclass {

public string accid{get;set;}
public string name{get;set;}
public string tt{get;set;}

public pagereference accidM(){

system.debug(name);
accid=name;
//accid= [select id from account where name=:name limit 1].id;

return null;
}


}