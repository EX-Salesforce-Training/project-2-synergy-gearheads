////////////////////////////////
//
//  Facility Component Controller
//
//	created by: Richard 'Jerry' Laughter
//	
//	created on: 8/19/2021
//  last edited: 8/19/2021
//
////////////////////////////////

public class FacilitiesController {
	@AuraEnabled
    public static List<sObject> getFacilities(String recordID){
        List<Facility__c> facilityList = [SELECT Id, Name, Supported_Skills__c FROM Facility__c WHERE Guild_Hall__c =: recordId];
        return facilityList;
    }

}