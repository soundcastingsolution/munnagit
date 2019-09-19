public class Dynamicrows
{
    
    public List<Account> AddList {get;set;}
    
    public Dynamicrows()
    {
        
        AddList = new List<Account>();
        AddList.add(new Account());
    }  
    public void AddRow()
    {
        AddList.add(new Account());
    }
 public PageReference save() {

        // Add the account to the database.
        insert  AddList;

        // Send the user to the detail page for the new account.

        PageReference pageRef = new PageReference('https://ap2.salesforce.com/001/o');
          pageref.setredirect(true);
          return pageRef;
        

   }


}