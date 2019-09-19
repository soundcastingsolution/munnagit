public with sharing class TestPopup {

    public Boolean displayPopup {get;set;}

    public TestPopup(ApexPages.StandardController controller) {

    }
    
    public void showPopup()
    {
        
    displayPopup = true;

    
    }
    
    public void closePopup() {
        displayPopup = false;
        
    }
    
    public PageReference redirectPopup()
    {
     displayPopup = false;
     pageReference p=new Pagereference('https://ap2.salesforce.com/001/o');
         p.setRedirect(true);
         return p;
        
    }
    


}