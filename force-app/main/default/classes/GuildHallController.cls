public class GuildHallController {
	@AuraEnabled
    public static List<sObject> getRelated(string curObject, string recordID){
        string qString = 'SELECT Id, Name FROM ' + curObject + ' WHERE Guild_Hall__c LIKE :' + recordId;
        List<sObject> returnList = database.query(qString);
        return returnList;
    }
}