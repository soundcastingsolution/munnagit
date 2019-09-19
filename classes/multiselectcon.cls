public class multiselectcon {
public selectoption[] conrightList{get;set;}
public selectoption[] getconleftlist(){

List<selectoption> conlist = new List<selectoption>();

List<contact> con = [select id,name from contact limit 10];

for(contact loopcon:con ) {

conlist.add(new SelectOption(loopcon.id,loopcon.name));

}

return conlist;
}



}