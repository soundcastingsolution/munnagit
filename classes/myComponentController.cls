public class myComponentController {
    
  public String controllerValue{get;set;}
  
  public string getcontact(){
  
  String str='';
    if(!string.isblank(controllerValue)){
    contact con =[select id,name,Account.name from contact where id=:controllerValue limit 1];
    Xmlstreamwriter xmlW = new Xmlstreamwriter();
    xmlW.writeStartElement(null,'contactname', null);
    xmlW.writeCharacters(con.name);
    xmlW.writeEndElement();
    xmlW.writeStartElement(null,'Account', null);
    xmlW.writeStartElement(null,'Accountid', null);
    xmlW.writeCharacters(con.Accountid);
    xmlW.writeEndElement();
    xmlW.writeStartElement(null,'Accountname', null);
    xmlW.writeCharacters(con.Account.name);
    xmlW.writeEndElement();
    xmlW.writeEndElement(); 
    
 str = xmlW.getXmlString();
 
 }
 

 return str;
  
  }
    
  
}