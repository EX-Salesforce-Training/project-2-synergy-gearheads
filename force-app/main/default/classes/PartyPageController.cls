global with sharing class PartyPageController {
	//public static String partyid {get;set;}	// id of currentParty
    public static Party__c currentParty {get;set;}	// Party to display on PartyPage
    public static List<Guild_Member__c> currentPartyMembers {get;set;}	// currentParty's guild members
    
	@AuraEnabled
    public static List<Guild_Member__c> getPartyMembers(String partyName) {
        if(Schema.SObjectType.Party__c.isAccessible()){
			currentParty = [SELECT Id, Name, Party_Size__c, Max_Party_Size__c, Accepting_New_Members__c, Minimum_Level_Required__c, Class_Requirements__c, (SELECT Guild_Member__c FROM Member_Assignments__r) FROM Party__c WHERE Name = :partyName];
            system.debug(currentParty);
        	Set<string> ids = new Set<string>();
        	for (Member_Assignment__c ma : currentParty.Member_Assignments__r) {
            	ids.add(ma.Guild_Member__c);
        	}
            system.debug(ids);
        	currentPartyMembers = [SELECT Name, Class__c, Race__c, Active__c FROM Guild_Member__c WHERE Id IN :ids]; 
            system.debug(currentPartyMembers);
        } else {
            throw new AuraHandledException('You do not have access to the Party object.');
        }
        
        system.debug(currentPartyMembers);
        return currentPartyMembers;
        
   	}
    
    @AuraEnabled
    public static boolean isRecruiting(String partyName) {
        currentParty = [SELECT Id, Name, Accepting_New_Members__c FROM Party__c WHERE Name = :partyName];
        if (currentParty.Accepting_New_Members__c) {
            return true;
        }
        return false;
    }
    
    @AuraEnabled
    public static void joinParty(String partyName) {
        currentParty = [SELECT Id, Name, Accepting_New_Members__c FROM Party__c WHERE Name = :partyName];
        if (!currentParty.Accepting_New_Members__c) {
            return;
        }
        
        string userid = UserInfo.getUserId();
        List<Guild_Member__c> gm = [SELECT Id, Name, Class__c, Race__c, Active__c FROM Guild_Member__c WHERE User__c = :userid LIMIT 1];
        if (gm.isEmpty()) {
            return;
        }
        
        Member_Assignment__c ma = new Member_Assignment__c();
        ma.Guild_Member__c = gm[0].Id;
        ma.Party__c = currentParty.Id;
        
        try {
            insert ma;
        }
        catch (DMLException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.SEVERITY.FATAL, e.getMessage()));
        }
    }
}