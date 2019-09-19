trigger recursivecheck on Account(before insert,before update,after insert,after update){

helpertrigger.helpermethod();
if(trigger.isbefore){
system.debug('@@@@before'+AvoidRecursionnew.isFirstRun());

}

if(trigger.isafter){

system.debug('@@@@after'+AvoidRecursionnew.isFirstRun());
}
}