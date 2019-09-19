@istest
public class LeadProcessorTest {

public static testmethod void LeadProcessorTestmethod(){

Lead leadins; 
List<lead> leadlist = new List<lead>();

for(integer i=0;i<200;i++){

leadins= new Lead();
leadins.lastname='teslead'+i;
leadins.Company='Saiorg';
//leadins.LeadSource ='Dreamforce';
leadlist.add(leadins);  
    
}

insert leadlist;
 

 Test.startTest();
 LeadProcessor obj = new LeadProcessor('select id,LeadSource from Lead');
 database.executebatch(obj);
 
 Test.StopTest();
}
 
}