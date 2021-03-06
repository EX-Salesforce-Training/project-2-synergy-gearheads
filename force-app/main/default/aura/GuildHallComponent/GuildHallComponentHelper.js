({
   
    getQuests : function (component, event, helper){
        component.set('v.questColumns', [
            {label: 'Quest Name', fieldName: 'Name'}
        ]);
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