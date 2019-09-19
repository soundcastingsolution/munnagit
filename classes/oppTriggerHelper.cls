public class oppTriggerHelper{
    public void crtTask(list<Opportunity> optLst){
        List<TasK> taskLst = new List<Task>();
        if(optLst.size()>0){
            for(Opportunity opt:optLst){
                if(opt.StageName == 'Closed Won'){
                    Task T = new Task();
                    T.Type = 'Email';
                    T.Subject = 'Follow Up Test Task'; 
                    T.OwnerId = opt.Ownerid; 
                    T.WhatId = opt.id;
                    taskLst.add(T);  
                }
            }
        }
        if(taskLst.size()>0){
            database.insert(taskLst);
        }
    }
}