public class myControllerExtension {

    private final Opportunity opp;
    public string svalue {get;set;}
    
    
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public myControllerExtension(ApexPages.StandardController stdController) {
        this.opp = (opportunity)stdController.getRecord();
    }
    public void call() {
    
    system.debug('@@@@@@@@'+Apexpages.currentPage().getParameters().get('svalue'));
    }
    public String getGreeting() {
        return 'Hello ' + opp.name + ' (' + opp.id + ')';
    }
    
    public string getstage(string stagedata) {
    
    svalue=string.valueof(stagedata);
    return stagedata;
    }
    
    
}