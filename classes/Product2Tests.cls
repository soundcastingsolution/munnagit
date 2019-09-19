@isTest (seeAllData=true)
private class Product2Tests {

    /**
     * @name product2Extension_UnitTest
     * @description UnitTest for product2Extension
    **/
    @isTest 
    static void Product2Extension_UnitTest(){
        PageReference pageRef = Page.Product2New;
        Test.setCurrentPage(pageRef);
        Product2 prod = new Product2(name='Test',isActive=true);        
        ApexPages.StandardController stdcontroller = new ApexPages.StandardController(prod);        
        Product2Extension ext = new Product2Extension(stdcontroller);        
        System.assertEquals(Constants.DEFAULT_ROWS, ext.productsToInsert.size());
        
        ext.addRows();
        System.assertEquals(Constants.DEFAULT_ROWS * 2, ext.productsToInsert.size());
        
        for (Integer i = 0; i < 5; i++) {
            Product2Extension.ProductWrapper wrapper = ext.productsToInsert[i];
            
            Product2 testProduct = new Product2();
            testProduct.Name = 'Test Product ' + i;
            testProduct.IsActive = true;
            testProduct.Initial_Inventory__c = 20;
            testProduct.Family = Constants.PRODUCT_FAMILY[0].getValue();
            wrapper.productRecord = testProduct;
            
            PricebookEntry testEntry = new PricebookEntry();
            testEntry.IsActive = true;
            testEntry.UnitPrice = 10;
            wrapper.pricebookEntryRecord = testEntry;
        }
        
        Test.startTest();
        ext.save();
        Test.stopTest();
        
        ext.GetFamilyOptions();
        ext.GetInventory();
        List<Product2> createdProducts = [
            SELECT
                Id
            FROM
                Product2
        ];
        //System.assertEquals(5, createdProducts.size());
    }
    
   
    public static TestMethod void Product2Trigger_UnitTest(){
        
         PageReference pageRef = Page.Product2New;
         Test.setCurrentPage(pageRef);
         product2Extension ext = new product2Extension(new apexPages.standardController(new Product2()));
         ext.addRows();
         ext.addRows();
         ext.productsToInsert[0].productRecord.Name = 'TestTestTest';
         ext.productsToInsert[0].productRecord.Family = 'Entree';
         ext.productsToInsert[0].pricebookEntryRecord.UnitPrice = 1;
         ext.productsToInsert[0].pricebookEntryRecord.IsActive = true;
         ext.productsToInsert[0].productRecord.Initial_Inventory__c = 10;
         ext.save();
         
        
         
         delete [SELECT Id FROM Product2 WHERE Name = 'TestTestTest'];
    }

}