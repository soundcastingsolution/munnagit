@isTest
private class ProjectCalloutServiceTest {
    //Implement mock callout tests here

    @testSetup static void testSetupdata(){
        //create the opportunity record
        
        Opportunity opp1 = new Opportunity();
        
        opp1.Name = 'sai Corp1';
        opp1.Type = 'New Project';
        opp1.Amount = 200;
        opp1.CloseDate = Date.today();
        opp1.StageName = 'Submitted Project';
        insert opp1;
        //create the opportunity record
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'sai Corp2';
        
        opp2.Type = 'New Project';
        opp2.Amount = 150;
        opp2.CloseDate = Date.today();
        opp2.StageName = 'Resubmit Project';
        insert opp2;
        //create the Custom Settings
        ServiceTokens__c servToken = new ServiceTokens__c();
        servToken.Name = 'ProjectServiceToken';
        servToken.Token__c = '3a771469-f23f-4767-971d-2032c594619f';
        insert servToken;
    }
    
    @isTest static void testPostCalloutSuccess() {
        Opportunity opp = [Select Id, Name FROM Opportunity WHERE Name = 'sai Corp1' Limit 1];
        List<Id> oppList = new List<Id>();
        oppList.add(opp.Id);
        System.assertEquals('sai Corp1', opp.Name);
        System.assertEquals(1,oppList.size());
        Test.startTest();
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new ProjectCalloutServiceMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock.
        
        
         ProjectCalloutService.postOpportunityToPMS(oppList);
         
        // Verify that the response received contains fake values
        Test.stopTest();    
        opp = [select StageName from Opportunity where id =: opp.Id];
        System.assertEquals('Submitted Project',opp.StageName);
    }
    
    @isTest static void testPostCalloutFailure() {
        Opportunity opp = [Select Id, Name FROM Opportunity WHERE Name = 'sai Corp2' Limit 1];
        List<Id> oppList = new List<Id>();
        oppList.add(opp.Id);
        System.assertEquals('sai Corp2', opp.Name);
        System.assertEquals(1,oppList.size());
        Test.startTest();
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new ProjectCalloutServiceMockFailure()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        ProjectCalloutService.postOpportunityToPMS(oppList);
        // Verify that the response received contains fake values
        Test.stopTest();        
        opp = [select StageName from Opportunity where id =: opp.Id];
        System.assertEquals('Resubmit Project',opp.StageName);
    }
    
}