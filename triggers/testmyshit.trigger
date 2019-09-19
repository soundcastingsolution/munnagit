trigger testmyshit on Contact (after update) {

system.debug('@@@@old'+trigger.old[0].email);
system.debug('@@@@oldmap'+trigger.oldmap.get(trigger.old[0].id).email);

system.debug('@@@@@@@@new'+trigger.new[0].email);
system.debug('@@@@newmap'+trigger.newmap.get(trigger.new[0].id).email);
  
    

}