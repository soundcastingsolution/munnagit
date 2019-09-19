trigger TeamMail on Opportunity (after insert,after update) {

TeamMailhandler obj = new TeamMailhandler();
obj.TeamMailMethod(Trigger.newmap.keyset());
}