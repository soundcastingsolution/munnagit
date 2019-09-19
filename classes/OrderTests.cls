@isTest (seeAllData=false)
private class OrderTests {

@testsetup
static void SetupTestData(){

TestDataFactory.InsertTestData(Constants.DEFAULT_ROWS);

}

@isTest static void OrderExtension_UnitTest() {
        Order ord = [select id, Status,Accountid,EffectiveDate from Order limit 1];
        PageReference pageRef = Page.OrderEdit;
        Test.setCurrentPage(pageRef);
        
        ApexPages.StandardController stdcontroller = new ApexPages.StandardController(ord);        
        OrderExtension ext = new OrderExtension(stdcontroller);        
        System.assertEquals(Constants.DEFAULT_ROWS, ext.orderItemList.size());
        ext.OnFieldChange();
        ext.SelectFamily();
        ext.Save();
        ext.First();
        ext.Next();
        ext.Previous();
        ext.Last();
        ext.GetHasPrevious();
        ext.GetHasNext();
        ext.GetTotalPages();
        ext.GetPageNumber();
        List<SelectOption> options = ext.GetFamilyOptions();
    }

static testmethod void OrderUpdate_UnitTest(){


        Order ord = [select id, Status from Order limit 1];
        ord.status = constants.ACTIVATED_ORDER_STATUS;
         OrderItem oitems1 = [SELECT Id,Pricebookentry.Product2Id, Quantity
                                FROM OrderItem
                                WHERE OrderId=:ord.id limit 1];
         Product2 prod1 = [SELECT Family,Id,Name,Quantity_Ordered__c,Quantity_Remaining__c FROM Product2 where id=:oitems1.Pricebookentry.Product2Id limit 1];
        Update ord;
        OrderItem oitems2 = [SELECT Id,Pricebookentry.Product2Id, Quantity
                                FROM OrderItem
                                WHERE OrderId=:ord.id limit 1];
        
        Product2 prod2 = [SELECT Family,Id,Name,Quantity_Ordered__c,Quantity_Remaining__c FROM Product2 where id=:oitems1.Pricebookentry.Product2Id  limit 1];
        
        test.startTest();
        //decimal quan = decimal.valueof();
        TestDataFactory.VerifyQuantityOrdered(prod1,prod2,integer.valueof(oitems2.Quantity));
         Test.stopTest();


}


}