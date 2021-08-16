/*
 ********************************************************
 * Title: userInfoCardApexController
 * Author: Dominic Romanello
 * Created: 8/11/21
 * LastModified: 8/11/21
 * LastModifiedBy: Dominic Romanello
 * 
 * 
 ******************************************************** 
 */
public with sharing class userInfoCardApexController {
    
	@AuraEnabled
    public static Guild_Member__c getMember(String member){
        return [SELECT Id, Name, Active__c, Age__c, Artificer_Level__c, Barbarian_Level__c, Bard_Level__c, 
               Class__c, Cleric_Level__c, Date_Employment_Ended__c, Date_Hired__c, Druid_Level__c, Fighter_Level__c,
               Guild_Hall__c, Level__c, Member_Email__c, Monk_Level__c, Paladin_Level__c, Race__c, Ranger_Level__c, 
               Reason__c, Rogue_Level__c, Skills__c, Sorcerer_Level__c, Total_Level__c, User__c, Warlock_Level__c, Wizard_Level__c FROM Guild_Member__c WHERE Name = :member];
    }
}