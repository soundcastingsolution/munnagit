trigger afterevent on Account (after insert,after update) {

    if(trigger.isinsert){
    system.debug('@@@@@@@@newins'+trigger.new);
    

        system.debug('@@@@@@@@oldins'+trigger.old);
    }
    

  if(trigger.isupdate)  {
        system.debug('@@@@@@@@newupd'+trigger.new);


     system.debug('@@@@@@@@oldupd'+trigger.old);
    }
}