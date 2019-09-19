/**

This class is used in the trigger xR43_NARunlock.It will unlock the record with status rejected.

Intial version:Tadakaluru.saisekhar@accenture.com

Date:2/2/2017

**/

Public class xr43_NARunlock_handler {

/*Public static void unlock_NAR(Map<id,xR1_New_Account_Request__c> NARMAPnew,Map<id,xR1_New_Account_Request__c> NARMAPold){

//List<xR1_New_Account_Request__c> narlistunlock = new List<xR1_New_Account_Request__c>();
set<id> rejectlistid = new set<id>();
for(xR1_New_Account_Request__c loopnar:NARMAPnew.values()){

if((loopnar.xR1_Status_Request__c!=NARMAPold.get(loopnar.id).xR1_Status_Request__c) && loopnar.xR1_Status_Request__c =='DP Rejected' ){

//narlistunlock.add(loopnar);

rejectlistid.add(loopnar.id);
//Approval.LockResult[] unlockedlist = Approval.Unlock(loopnar.id, false);


}

}

/*if(narlistunlock.size()>0){
Approval.UnLockResult[] unlockedlist = Approval.Unlock(narlistunlock, false);

}*/

/*if(rejectlistid.size()>0){

//Approval.UnLockResult[] unlockedlist = Approval.Unlock(narlistunlock, false);
set<id> workitemids = new set<id>();
List<ProcessInstanceWorkitem> witem = new List<ProcessInstanceWorkitem>();

witem =[select id from ProcessInstanceWorkitem where ProcessInstance.targetobjectid=:rejectlistid];

for(ProcessInstanceWorkitem loopid:witem){

workitemids.add(loopid.id); 
    
}

for(id loopid:workitemids){
    
    Approval.ProcessWorkitemRequest rejreq = new Approval.ProcessWorkitemRequest();
    rejreq.setWorkitemId(loopid);
    rejreq.setAction('Reject');
    Approval.ProcessResult result2 =  Approval.process(rejreq);
}

}

}*/

}