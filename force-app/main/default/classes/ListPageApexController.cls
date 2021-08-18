public with sharing class ListPageApexController {

    private static final string selection_template = 'SELECT Id, Name {0} FROM {1} ORDER BY Id LIMIT {2} OFFSET {3}';
	private static final integer pageSize = 20;
    private static final Map<String, String> getObject = new Map<String, String>{'Guild Halls' => 'Guild_Hall__c', 'Parties' => 'Party__c', 'Quests' => 'Quest__c', 'Guild Members' => 'Guild_Member__c'};
    
    private static String formatQuery(string objectType, integer page){
        return String.format(selection_template, new List<String>{'', objectType, String.valueOf(pageSize), String.valueOf(page * pageSize)});
    }
    
    @AuraEnabled
    public static Integer getPageCount(String pageTitle){
        integer count = database.countQuery('select count() from ' + getObject.get(pageTitle));
        return integer.valueof(count / 20);
    }
    
    @AuraEnabled
    public static List<Guild_Member__c> getMembers(integer page){
        string bug = formatQuery('Guild_Member__c', page);
		List<Guild_Member__c> memberList = database.query(bug);
        return memberList;
    }
    
    @AuraEnabled
    public static List<Quest__c> getQuests(integer page){
        string bug = formatQuery('Quest__c', page);
		List<Quest__c> questList = database.query(bug);
        return questList;
    }
    
    @AuraEnabled
    public static List<Party__c> getParties(integer page){
        string bug = formatQuery('Party__c', page);
        List<Party__c> partyList = database.query(bug);
        return partyList;
    }
    
    @AuraEnabled
    public static List<Guild_Hall__c> getHalls(integer page){
        string bug = formatQuery('Guild_Hall__c', page);
        List<Guild_Hall__c> hallList = database.query(bug);
        return hallList;
    }
    
    
    
}