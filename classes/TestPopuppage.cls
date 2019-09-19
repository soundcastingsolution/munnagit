public with sharing class TestPopuppage {

    public Boolean displayPopup {get;set;}

   public List<Account> getacc() {
   
   return [select name from Account];
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
        
       PageReference p=new Pagereference('/apex/popuppage');
       p.setRedirect(true);
         return p;
        
    }
    


}