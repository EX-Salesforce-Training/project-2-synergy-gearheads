public class GuildHallController {
	@AuraEnabled
    public static List<Quest__c> getQuests(Id recordID){
        List<Quest__c> questList = [SELECT Id, Name, Danger_Level__c, Quest_Details__c, Reward__c, Status__c FROM Quest__c WHERE Guild_Hall__c =: recordId];
        return questList;
    }

}