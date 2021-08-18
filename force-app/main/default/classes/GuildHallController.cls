public class GuildHallController {
	@AuraEnabled
    public static List<sObject> getFacilities(String recordID){
        List<Facility__c> facilityList = [SELECT Id, Name FROM Facility__c WHERE Guild_Hall__c =: recordId];
        return facilityList;
    }

	@AuraEnabled
    public static List<Quest__c> getQuests(Id recordID){
        List<Quest__c> questList = [SELECT Id, Name FROM Quest__c WHERE Guild_Hall__c =: recordId];
        return questList;
    }

}