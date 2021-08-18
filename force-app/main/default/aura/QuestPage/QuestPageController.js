({   
    init : function(component, event, helper) {
        //component.find("accordion").set('v.activeSectionName', 'B');
        let Quests  = component.get("c.getQuestList");
        Quests.setParams({
            "partyName" : component.get("v.partyName")
        });
        console.log("Test: " + component.get("v.partyName"));
        Quests.setCallback(this, function(response){
        	let state = response.getState();
        	console.log(state);
        	if (state === "SUCCESS") {
        		component.set("v.quests", response.getReturnValue());
           		console.log(response.getReturnValue());
			}
        });
        $A.enqueueAction(Quests);
        
	},
    
    setAttributeValue: function(component, event, helper)
    {
        let eventValue= event.getParam("party");
        console.log("event: " + eventValue);
        component.set("v.partyName", eventValue);
        
        let a = component.get('c.init');
        $A.enqueueAction(a);
    }
})