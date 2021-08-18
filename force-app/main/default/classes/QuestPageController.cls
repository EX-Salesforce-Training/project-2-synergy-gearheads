public with sharing class QuestPageController {
	public static List<Quest__c> questList {get;set;}	// Quest List
    
    @AuraEnabled
    public static List<Quest__c> getQuestList(String partyName) {
        if(Schema.SObjectType.Quest__c.isAccessible()){
            questList = [SELECT Id, Party__r.Id, Name, Danger_Level__c, Location__c, Reward__c, Requires_Party__c, Status__c, Details__c, Quest_Details__c FROM Quest__c WHERE Party__r.Name = :partyName];
        } else {
            throw new AuraHandledException('You do not have access to the Quest object.');
        }
        
        return questList;
    }
}