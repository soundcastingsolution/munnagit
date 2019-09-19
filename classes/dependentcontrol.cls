public class dependentcontrol{

List<wrapperkeys> wrapkeylist{get;set;}
public Map<String, List<String>> mapcoll; 
public dependentcontrol(){

    
    
}
public List<wrapperkeys> getcontrolmethod(){
    
Schema.DescribeFieldResult F = Street23__c.country__c.getDescribe();
Schema.sObjectField con = F.getSObjectField();
Schema.DescribeFieldResult g = Street23__c.Dependent__c.getDescribe();
Schema.sObjectField dep = g.getSObjectField();

system.debug(Dependentpicklist.getDependentOptionsImpl(con,dep));

wrapkeylist = new List<wrapperkeys>();
mapcoll = new Map<String, List<String>>();
mapcoll= Dependentpicklist.getDependentOptionsImpl(dep,con);
for(string strloop:mapcoll.keyset()){
wrapkeylist.add(new wrapperkeys(strloop));  
}
return wrapkeylist;

}

public class wrapperkeys{

public boolean checkbox1{get;set;}
public String keylist{get;set;}
public List<wrappervalue> wrapvaluelist{get;set;}
Schema.DescribeFieldResult F1 = Street23__c.country__c.getDescribe();
Schema.sObjectField con1 = F1.getSObjectField();
Schema.DescribeFieldResult g1 = Street23__c.Dependent__c.getDescribe();
Schema.sObjectField dep1 = g1.getSObjectField();
Map<String, List<String>> mapcoll2= Dependentpicklist.getDependentOptionsImpl(dep1,con1);

public wrapperkeys(string str){
wrapvaluelist = new List<wrappervalue>();
keylist = str;
for(string str2:mapcoll2.get(str)){
wrapvaluelist.add(new wrappervalue(str2));

}
checkbox1 =false;   
}
}
public class wrappervalue {

public boolean checkbox2{get;set;}
public String valuelist{get;set;} 

public wrappervalue(string str){
valuelist = str;
checkbox2 =false;   
}
    
}

}