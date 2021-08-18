({
    getFacilities : function (component, event, helper){
        let action = component.get("c.getRelated");
        let curRecord = component.get("v.recordId");
        action.setParams({'curObject': 'Facility__c', 'recordID':curRecord});
		action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS"){
                let records = response.getReturnValue();
                component.set("v.facilities", records);
            }
        });
        $A.enqueueAction(action);                          
    },
    
    getParties : function (component, event, helper){
        let action = component.get("c.getRelated");
        let curRecord = component.get("v.recordId");
        action.setParams({'curObject': 'Party__c', 'recordID':curRecord});
		action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS"){
                let records = response.getReturnValue();
                component.set("v.parties", records);
            }
        });
        $A.enqueueAction(action);                          
    },
    
    getQuests : function (component, event, helper){
        let action = component.get("c.getRelated");
        let curRecord = component.get("v.recordId");
        action.setParams({'curObject': 'Quest__c', 'recordID':curRecord});
		action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS"){
                let records = response.getReturnValue();
                component.set("v.quests", records);
            }
        });
        $A.enqueueAction(action);                          
    }

})