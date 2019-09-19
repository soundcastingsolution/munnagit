@isTest
public class AddPrimaryContactTest 
{
    public  static testmethod void TestList()
     {
         List<Account> acctest = new List <Account>();
         for(Integer i=0;i<50;i++)
         {
             acctest.add(new Account(BillingState = 'CA', name = 'Test'+i));
         }
         for(Integer j=0;j<50;j++)
         {
             acctest.add(new Account(BillingState = 'NY', name = 'Test'+j));
         }
         insert acctest;

         Contact co = new Contact();
         co.FirstName='testcon';
         co.LastName ='testcon';
         insert co;
         String state = 'CA';
      
          AddPrimaryContact apc = new AddPrimaryContact(co, state);
          Test.startTest();
            System.enqueueJob(apc);
          Test.stopTest();
      }
 }