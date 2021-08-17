/*
 ********************************************************
 * Title: userItemInfoApex
 * Author: Dominic Romanello
 * Created: 8/16/21
 * LastModified: 8/16/21
 * LastModifiedBy: Dominic Romanello
 * Description: 
 * 
 ******************************************************** 
 */
public with sharing class userItemInfoApex { 
	
    @AuraEnabled
    public static List<Item__c> getItems(String memberId){
        return [SELECT Id, Name, Damage__c, Item_Type__c, Properties__c, Value__c FROM Item__c WHERE Guild_Member__c =: memberId];
    }
}