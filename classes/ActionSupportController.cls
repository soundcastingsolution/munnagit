public class ActionSupportController
{
    public Opportunity opptyObj{get;set;}
    public String fieldValue {get; set;}

    ApexPages.standardController stdController = null;
    public ActionSupportController(ApexPages.StandardController controller)     
    {
        this.stdController = controller;
        opptyObj = new Opportunity();
    }

    public void passValueToController()   
    {        
          fieldValue = opptyObj.Name;

    }

}