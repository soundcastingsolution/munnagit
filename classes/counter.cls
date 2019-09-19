public class counter {

public integer getcount(){

return integer.valueof([select count__c from counter__c where ownerid=:userinfo.getuserid() limit 1 ].count__c);
}
public void countint() {
  
 List<counter__c> counlist = new  List<counter__c>();
 List<counter__c> counins = new  List<counter__c>();
 for(counter__c counloop:[select id,count__c from counter__c where ownerid=:userinfo.getuserid()]){
   counloop.count__c=counloop.count__c+1;
   counlist.add(counloop);
 
 }
counter__c con;
if(!counlist.isempty()){
 update counlist;
 
 }
 
else {
 con = new counter__c();
 con.count__c =1;
 con.ownerid=userinfo.getuserid(); 
counins.add(con);    
}
if(!counins.isempty()){
    
    insert counins;
    
}
 
 
}



}