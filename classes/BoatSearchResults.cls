public class BoatSearchResults {

@AuraEnabled
Public static Boat__c[] getBoats(string boatTypeId){
 
 if(boatTypeId.trim()!=''){
 
 return [select id,name,BoatType__c,Contact__c,Picture__c,Price__c,Geolocation__Latitude__s,Geolocation__Longitude__s from Boat__c where BoatType__c=:boatTypeId ];
 
 }
 
 else {
 
 return [select id,name,BoatType__c,Contact__c,Picture__c,Price__c,Geolocation__Latitude__s,Geolocation__Longitude__s from Boat__c];
 
 }

}

}