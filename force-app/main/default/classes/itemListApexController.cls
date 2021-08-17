/*
 ********************************************************
 * Title: itemListApexController.apxc
 * Author: Dominic Romanello
 * Created: 8/16/21
 * LastModified: 8/16/21
 * LastModifiedBy: Dominic Romanello
 * Description: 
 * 
 ******************************************************** 
*/
public with sharing class itemListApexController {
	
    @AuraEnabled
    public static List<Item__c> getItems(){
        return [SELECT Id, Name, Damage__c, Damage_Type__c, Description__c, Guild_Hall__r.Name, Guild_Member__r.Name, Guild_Owned__c, Item_Type__c,
                Magic__c, Magic_Description__c, Properties__c, Value__c FROM Item__c];
    }
    
    @AuraEnabled
    public static List<Item__c> getFilteredItems(String itemType){
        return [SELECT Id, Name, Damage__c, Damage_Type__c, Description__c, Guild_Hall__r.Name, Guild_Member__r.Name, Guild_Owned__c, Item_Type__c,
                Magic__c, Magic_Description__c, Properties__c, Value__c FROM Item__c WHERE Item_Type__c = :itemType];
    }
    
    @AuraEnabled
    public static List<Item__c> getItemsByValue(Integer lower, Integer upper){
        return [SELECT Id, Name, Damage__c, Damage_Type__c, Description__c, Guild_Hall__r.Name, Guild_Member__r.Name, Guild_Owned__c, Item_Type__c,
                Magic__c, Magic_Description__c, Properties__c, Value__c FROM Item__c WHERE Value__c > :lower AND Value__c < :upper];
    }
    
    @AuraEnabled
    public static List<Item__c> getItemsByGuild(Boolean value){
        return [SELECT Id, Name, Damage__c, Damage_Type__c, Description__c, Guild_Hall__r.Name, Guild_Member__r.Name, Guild_Owned__c, Item_Type__c,
                Magic__c, Magic_Description__c, Properties__c, Value__c FROM Item__c WHERE Guild_Owned__C = :value];
    }
    
    @AuraEnabled
    public static List<Item__c> getItemsByMagic(Boolean value){
        return [SELECT Id, Name, Damage__c, Damage_Type__c, Description__c, Guild_Hall__r.Name, Guild_Member__r.Name, Guild_Owned__c, Item_Type__c,
                Magic__c, Magic_Description__c, Properties__c, Value__c FROM Item__c WHERE Magic__c = :value];
    }
}