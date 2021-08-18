public class TestContentGenerator {

    public integer numOfAccounts = 10;
    public integer numOfContacts = 20;
    public integer numOfFacilities = 30;
    public integer numOfGuildHalls = 20;
    public integer numOfGuildMembers = 30;
    public integer numOfItems = 30;
    public integer numOfParties = 30;
    public integer numOfQuests = 30;

    public List<String> firstNames = new List<String>{'Liam', 'Noah', 'Oliver', 'Elijah', 'William', 'James', 'Benjamin', 'Lucas', 'Henry', 'Alexander', 'Mason', 'Michael', 'Ethan', 'Daniel', 'Jacob', 'Logan', 'Jackson', 'Levi', 'Sebastian', 'Mateo', 'Jack', 'Owen', 'Theodore', 'Aiden', 'Samuel', 'Joseph', 'John', 'David'};
    public List<String> lastNames = new List<String>{'Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller', 'Davis', 'Rodriguez', 'Martinez', 'Hernandez', 'Lopez', 'Gonzalez', 'Wilson', 'Anderson', 'Thomas', 'Taylor', 'Moore', 'Jackson', 'Martin', 'Lee'};
    public List<String> Adverbs = new List<String>{'boldly', 'bravely', 'brightly', 'cheerfully', 'deftly', 'devotedly', 'eagerly', 'elegantly', 'faithfully', 'fortunately', 'gleefully', 'gracefully', 'happily', 'honestly', 'innocently', 'kindly', 'merrily', 'obediently', 'perfectly', 'politely', 'powerfully', 'safely', 'victoriously', 'warmly', 'vivaciously'};
    public List<String> Nouns = new List<String>{'meat', 'year', 'thanks', 'music', 'person', 'reading', 'method', 'data', 'food', 'understanding', 'theory', 'law', 'bird', 'literature', 'problem', 'software', 'control', 'knowledge', 'power', 'ability', 'economics', 'love', 'internet', 'television', 'science', 'library', 'nature', 'fact', 'product', 'idea', 'temperature', 'investment', 'area', 'society', 'activity', 'story', 'industry'};
    public List<String> Adjectives = new List<String>{'adorable', 'adventurous', 'aggressive', 'agreeable', 'alert', 'alive', 'amused', 'angry', 'annoyed', 'annoying', 'anxious', 'arrogant', 'ashamed', 'attractive', 'average', 'awful', 'bad', 'beautiful', 'better', 'bewildered', 'black', 'bloody', 'blue', 'blue-eyed', 'blushing', 'bored', 'brainy', 'brave', 'breakable', 'bright', 'busy', 'calm', 'careful', 'cautious', 'charming', 'cheerful', 'clean', 'clear', 'clever', 'cloudy', 'clumsy', 'colorful'};
    public List<String> States = new List<String>{'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'NewHampshire', 'NewJersey', 'NewMexico', 'NewYork', 'NorthCarolina', 'NorthDakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'RhodeIsland', 'SouthCarolina', 'SouthDakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'WestVirginia', 'Wisconsin', 'Wyoming'};
    public List<String> Races = new List<String>{'Aarakocra', 'Aasimar', 'Bugbear', 'Centuar', 'Changeling', 'Dragonborn', 'Dwarf', 'Elf', 'Firbolg', 'Genasi', 'Gith', 'Gnome', 'Goblin', 'Goliath', 'Half-Elf', 'Halfling', 'Half-Orc', 'Hobgoblin', 'Human', 'Kalashtar', 'Kenku', 'Kobold', 'Lizardfolk', 'Loxodon', 'Minotaur', 'Orc', 'Shifter', 'Simic Hybrid', 'Tabaxi', 'Tiefling', 'Tortle', 'Triton', 'Vedalken', 'Warforged', 'Yuan-ti Pureblood'};

    final string cons = 'bcdfghjklmnpqrstvwxz';
    final string vowels = 'aeiou';
    final integer maxNameLength = 12;
    
    public List<Account> accountList = new List<Account>();
    public List<Contact> contactList = new List<Contact>();
    public List<Guild_Hall__c> hallList = new List<Guild_Hall__c>();
	public List<Guild_Member__c> memberList = new List<Guild_Member__c>();
	public List<Facility__c> facilityList = new List<Facility__c>();
	public List<Item__c> itemList = new List<Item__c>();
    public List<Party__c> partyList = new List<Party__c>();
	public List<Member_Assignment__c> assignmentList = new List<Member_Assignment__c>();
    public List<Quest__c> questList = new List<Quest__c>();
    
    public void generate(){
        generateAccounts(numOfAccounts);
        generateContacts(numOfContacts);
        generateGuildHall(numOfGuildHalls);
        generateMembers(numOfGuildMembers);
        generateFacilities(numOfFacilities);
		generateParties(numOfParties);
        generateMemberAssignments();
        generateQuests(numOfQuests);
        
    }
    
    public void generateQuests(integer maxQuests){
        for (integer index = 0; index < maxQuests; index++){
            Quest__c quest = new Quest__c();
            quest.Contact__c = ((Contact) getRandomObject(contactList)).id;
            quest.Name = getEsoName();
            quest.Danger_Level__c = 'Medium';
            quest.Date_Opened__c = getDate();
            quest.Location__c = getSelection(States);
            quest.Reward__c = integer.valueOf(Math.random()*2000);
            quest.Status__c = 'Open';
            quest.Sub_Status__c = 'Pending';
            quest.Guild_Member__c = ((Guild_Member__c) getRandomObject(memberList)).id;
            quest.Guild_Hall__c = ((Guild_Hall__c) getRandomObject(hallList)).id;
            quest.Quest_City__c = nameGen();
            quest.Quest_Country__c = nameGen();
            quest.Quest_State__c = getSelection(States);
            quest.Quest_Postal_Code__c = getPostal();
            quest.Quest_Street__c = nameGen();
            quest.Quest_Details__c = getEsoName();
            questList.add(quest);
            
        }
        database.insert(questList);
        system.debug(questList);
    }

    public void generateMemberAssignments(){
        for (Guild_Member__c member: memberList){
            Member_Assignment__c assign = new Member_Assignment__c();
			Party__c part = ((Party__c) getRandomObject(partyList));
            assign.Party__c = part.id;
            assign.Guild_Member__c = member.id;
            assignmentList.add(assign);            
        }
        database.insert(assignmentList, False);
        system.debug(assignmentList);

    }
    
    public Date getDate(){
        integer year = integer.valueof(Math.random() * 40 + 1960);
        integer month = integer.valueof(Math.random() * 12 +1 );
        integer day =  integer.valueof(Math.random() * 28 + 1);
        Date myDate = Date.newInstance(year, month ,day );
		return myDate;
    }
    
    public String getPostal(){
        String int1 = String.valueOf(integer.valueof(Math.random() * 10));
        String int2 = String.valueOf(integer.valueof(Math.random() * 10));
        String int3 = String.valueOf(integer.valueof(Math.random() * 10));
        String int4 = String.valueOf(integer.valueof(Math.random() * 10));
        String int5 = String.valueOf(integer.valueof(Math.random() * 10));
        return int1 + int2 + int3 + int4 + int5;
    }
    
    public void generateParties(integer maxParties){
        for (integer index = 0; index < maxParties; index++){
            Party__c part = new Party__c();
            part.Accepting_New_Members__c = True;
            part.Class_Requirements__c = 'Artificer';
            part.Name = getEsoName();
            part.Max_Party_Size__c = 4+ rollD6();
            part.Minimum_Level_Required__c = 1;
			partyList.add(part);
        }
        Database.insert(partyList);
        system.debug(partyList);
    }

    public void generateItems(integer maxItems){
        for (integer index = 0; index < maxItems; index++){
            Item__c item = new Item__c();
            item.Name = getEsoName();

            Guild_Member__c mem = ((Guild_Member__c) getRandomObject(memberList));
            
            item.Guild_Hall__c = mem.Guild_Hall__c;
            item.Guild_Member__c = mem.id;
            item.Damage__c = '1d4';
            item.Damage_Type__c = 'Slashing';
			itemList.add(item);
        }
        database.insert(itemList);
        system.debug(itemList);
    }
    
    public void generateFacilities(integer maxFacilities){
        for (integer index = 0; index < maxFacilities; index++){
            Facility__c fac = new Facility__c();
            fac.Guild_Hall__c = ((Guild_Hall__c) getRandomObject(hallList)).id;
            fac.Name = NameGen() + ' ' + getSelection(Nouns);
            fac.Supported_Skills__c = 'Athletics';
            facilityList.add(fac);
        }
        database.insert(facilityList);
        system.debug(facilityList);
    }
    
    public void generateMembers(integer maxMembers){
        for (integer index = 0; index < maxMembers; index++){
            Guild_Member__c mem = new Guild_Member__c();

            string memName = getFullName();
            
            mem.Active__c = True;
            mem.Age__c = 15 + rollD20();
            mem.Artificer_Level__c = 1 + rollD20();
            mem.Barbarian_Level__c = rollD20();
            mem.Bard_Level__c = rollD20();
            mem.Class__c = 'Artificer';
            mem.Cleric_Level__c = rollD20();
            mem.Druid_Level__c = rollD20();
            mem.Fighter_Level__c = rollD20();
            mem.Guild_Hall__c = ((Guild_Hall__c) getRandomObject(hallList)).id;
            mem.Member_Email__c = genEmail(memName);
            mem.Monk_Level__c = rollD20();
            mem.Name = memName;
            mem.Paladin_Level__c = rollD20();
            //mem.Race__c = getSelection(Races);
            mem.Ranger_Level__c = rollD20();
            mem.Rogue_Level__c = rollD20();
            mem.Skills__c = 'Athletics';
            mem.Sorcerer_Level__c = rollD20();
			memberList.add(mem);
        }
        database.insert(memberList);
        system.debug(memberList);
    }
    
    public String genEmail(String name){
		String[] splitStr = name.split(' ');
		String newStr = '';
        for(String s: splitStr){
            newStr = newStr + s;
        }
        return newStr + string.valueof(integer.valueof(math.random() * 2000)) + '@dndfakesite.com';
    }

    public sObject getRandomObject(List<sObject> objList){
        system.debug(objList);
        return objList[Integer.valueOf(Math.random()* objList.size() ) ] ;
    }
    
    public integer rollD20(){
        return integer.valueOf(Math.random() * 20);
    }
        
    public integer rollD6(){
        return integer.valueOf(Math.random() * 6);
    }
        
    public void generateGuildHall(integer maxHalls){
        for (integer index = 0; index < maxHalls; index++){
            Guild_Hall__c hall = new Guild_Hall__c();
            hall.Location__c = getSelection(States);
            hall.Name = getEsoName();
            hallList.add(hall);
        }
        database.insert(hallList);
        system.debug(hallList);
    }
    
    public void generateContacts(integer maxContacts){
        for (integer index = 0; index < maxContacts; index++ ){
            Contact con = new Contact();
            con.FirstName = getSelection( firstNames);
            con.LastName = getSelection(lastNames);
            contactList.add(con);
        }
        database.insert(contactList);
        system.debug(contactList);
    }	    

    public void generateAccounts(integer maxAccounts){
        for(integer cur = 0; cur < maxAccounts; cur++){
            Account acc = new Account();
            acc.Name = NameGen();
            accountList.add(acc);
        }
        database.insert(accountList);
        system.debug(accountList);
    }

    public string getSelection(List<String> strList){
        return strList[Integer.valueOf(Math.random()*strList.size() ) ];        
    }
    
    public string getEsoName(){
        return getSelection(Adverbs) + ' ' + getSelection(Adjectives) + ' ' + getSelection(Nouns);
    }
    
    public string getFullName(){
        return getSelection(firstNames) + ' ' + getSelection(lastNames);
    }
    
	public string NameGen(){
		//selects the length of the name, min 3, max 15
        integer length = Integer.valueof((Math.random()*maxNameLength))+3;
		//selects if the vowels are the even letters or not
        integer even = Integer.valueof((Math.random()*2));
        string pokeName = '';

        //loops over the length of the name
        for(integer pos = 0; pos < length; pos++){
			string letter = '';
			//if the pos mod 2 doesn't match even then use a random consanant, else use a random vowel
            if (Math.mod(pos, 2) != even){
				integer selection = Integer.valueof((Math.random()*cons.length()));
                letter = cons.substring(selection, selection+1);
            }else{
				integer selection = Integer.valueof((Math.random()*vowels.length()));
                letter = vowels.substring(selection, selection+1);                
            }
            pokeName += letter;
        }
        return pokeName;
    }
        

}