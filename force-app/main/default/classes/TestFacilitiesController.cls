//////////////////////////////////
//
// Facilities Controller Test
// 
// testing coverage 100%
// utilizes the TestContentGenerator to create random but valid records
//
// created on: 8/19/2021
// last edited: 8/19/2021
//
//////////////////////////////////

@isTest
public class TestFacilitiesController {
    @isTest static void TestGetFacilitiesMethod(){
        TestContentGenerator gen = new TestContentGenerator();
        gen.generate();
        List<sObject> testObject = FacilitiesController.getFacilities(gen.getRandomObject(gen.hallList).Id);
    }
}