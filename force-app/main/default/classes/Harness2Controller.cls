public class Harness2Controller {
	@auraEnabled
    public static List<ID> getMyContacts(){
        List<ID> ids = new List<ID>();
        if(Schema.SObjectType.Contact.IsAccessible()){
            for(contact c: [SELECT id FROM Contact]){
                ids.add(c.id);
            }
        }else{
            throw new AuraHandledException('you do not have access to the contact object');
        }
        return ids;
    }
}