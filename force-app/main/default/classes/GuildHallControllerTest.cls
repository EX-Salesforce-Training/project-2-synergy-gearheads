//////////////////////////////////
//
// Guild Hall Controller Test
// 
// testing coverage 100%
// utilizes the TestContentGenerator to create random but valid records
//
// created on: 8/18/2021
// last edited: 8/18/2021
//
//////////////////////////////////

@isTest
public class GuildHallControllerTest {
    @isTest static void TestGetQuestsMethod(){
        TestContentGenerator gen = new TestContentGenerator();
        gen.generate();
        List<sObject> testObject = GuildHallController.getQuests(gen.getRandomObject(gen.questList).Id);
    }
    
}