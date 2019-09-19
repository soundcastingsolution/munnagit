public with sharing class BoatReviews
{
    @AuraEnabled
    public static List<BoatReview__c>  getAll(String boatId)
    {
        
        return [SELECT Id,Boat__c,Comment__c,Rating__c,CreatedBy.Id,CreatedBy.Name,CreatedBy.SmallPhotoUrl,CreatedBy.CompanyName,LastModifiedDate,CreatedDate from BoatReview__c where Boat__c =: boatId];
    }
}