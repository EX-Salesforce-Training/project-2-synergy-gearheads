////////////////////////////////
//
// List Page controller test
// utilizing the test content generator
// 
// code coverage 100%
// 
// created on 8/18/2021
//
// last edited 8/18/2021
//
//
///////////////////////////////

@IsTest
public class ListPageConTest {
    @IsTest static void TestCountMethod(){
        TestContentGenerator gen = new TestContentGenerator();
        gen.generate();
        integer memberCount = ListPageApexController.getPageCount('Guild Members');
        integer questCount = ListPageApexController.getPageCount('Quests');
        integer partyCount = ListPageApexController.getPageCount('Parties');
        integer guildCount = ListPageApexController.getPageCount('Guild Halls');
    }
    
    @IsTest static void TestGetMembers(){
        TestContentGenerator gen = new TestContentGenerator();
        gen.generate();
		List<Guild_Member__c> memberList = ListPageApexController.getMembers(0);
    }
    
    @IsTest static void TestGetQuests(){
        TestContentGenerator gen = new TestContentGenerator();
        gen.generate();
		List<Quest__c> questList = ListPageApexController.getQuests(0);
    }
    
    @IsTest static void TestGetParties(){
        TestContentGenerator gen = new TestContentGenerator();
        gen.generate();
		List<Party__c> memberList = ListPageApexController.getParties(0);
    }
    
    @IsTest static void TestGetHalls(){
        TestContentGenerator gen = new TestContentGenerator();
        gen.generate();
		List<Guild_Hall__c> memberList = ListPageApexController.getHalls(0);
    }
    
}