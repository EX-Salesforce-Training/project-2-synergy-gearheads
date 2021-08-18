({
    getFacilities : function (component, event, helper){
        let action = component.get("c.getFacilities");
        let curRecord = component.get("v.recordId");
        action.setParams({'recordID':curRecord});
		action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS"){
                let records = response.getReturnValue();
                component.set("v.facilities", records);
            }
        });
        $A.enqueueAction(action);                          
    },
    
    getQuests : function (component, event, helper){
        let action = component.get("c.getQuests");
        let curRecord = component.get("v.recordId");
        action.setParams({'recordID':curRecord});
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