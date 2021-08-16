({
    init : function(component, event, helper) {
        //let partyName = component.get("v.partyName");
        
        component.set('v.myColumns', [
            {label: 'Guild Member Name', fieldName: 'linkName', type: 'url', 
             typeAttributes: {label: {fieldName: 'Name'}, target:'_blank'}},
            {label: 'Class', fieldName: 'Class__c', type: 'Picklist (Multi-Select)'},
            {label: 'Race', fieldName: 'Race__c', type: 'Picklist'},
            {label: 'Active', fieldName: 'Active__c', type: 'Checkbox'}
        ]);
        
      	let action  = component.get("c.getPartyMembers");
        
        action.setParams({ "partyName" : component.get("v.partyName") });
        
        action.setCallback(this, function(response){
            let state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                let records = response.getReturnValue();
				records.forEach(function(record){
					record.linkName = '/'+record.Id;
    			});
                console.log(response.getParams.name);
                component.set("v.partyMembers", response.getReturnValue());
            	console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(action);  
        
        let check = component.get("c.isRecruiting");
        
        check.setParams({ "partyName": component.get("v.partyName") });
        
        check.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS") {
                if (response.getReturnValue() === false) {
                    component.set("v.notRecruiting", "Not recruiting at this time.");
            		console.log(response.getReturnValue());
                } else {
                    component.set("v.notRecruiting", "Join Party");
                }
            }
        });
        $A.enqueueAction(check);
    },
    
    handleClick : function(component, event, helper) {
        let action  = component.get("c.joinParty");
        action.setParams({ "partyName": component.get("v.partyName") });

        let a = component.get('c.init');
        
        $A.enqueueAction(action);
        $A.enqueueAction(a);
    }
})