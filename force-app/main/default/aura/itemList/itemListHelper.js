({
	getAllItems : function(component) {
		component.set("v.columns", [
            {label:"Name", fieldName:"Link", type:"url", typeAttributes:{label:{fieldName:"Name"}, target:"{c:itemInfo}"}},
            {label:"Type", fieldName:"Item_Type__c"},
            {label:"Value", fieldName:"Value__c", type:"currency", typeAttributes:{currencyCode:"USD"}},
            {label:"Guild Owned?", fieldName:"Guild_Owned__c", type:"boolean"},
            {label:"Damage", fieldName:"Damage__c"},
            {label:"Magic?", fieldName:"Magic__c", type:"boolean"},
            {label:"Properties", fieldName:"Properties__c"}
            
        ]);
        
        let action = component.get("c.getItems");
        
        action.setCallback(this, function(response){
            let state = response.getState();
            if(state === "SUCCESS"){
                var records = response.getReturnValue();
                records.forEach(function(record){
                    record.Link='/'+record.Id
                });
                component.set("v.data", records);
                console.log(records);
            }else{
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
	},
    
    filterItems : function(component, itemType){
        let action = component.get("c.getFilteredItems");
        action.setParams({"itemType": itemType});
        
        action.setCallback(this, function(response){
            let state= response.getState();
            if(state === "SUCCESS"){
                var records = response.getReturnValue();
                records.forEach(function(record){
                    record.Link='/'+record.Id
                });
                component.set("v.data",records);
                console.log(records);
            }else{
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    
    valueFilter : function(component, lower, upper){
        let action = component.get("c.getItemsByValue");
        action.setParams({
            "lower" : lower,
            "upper" : upper
        });
        action.setCallback(this, function(response){
            let state = response.getState();
            if(state === "SUCCESS"){
                var records = response.getReturnValue();
                records.forEach(function(record){
                    record.Link='/'+record.Id
                });
                component.set("v.data", records);
                console.log(records);
            }else{
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    
    guildFilter : function(component, value){
        let action = component.get("c.getItemsByGuild");
        action.setParams({"value": value});
        action.setCallback(this, function(response){
            let state = response.getState();
            if(state === "SUCCESS"){
                var records = response.getReturnValue();
                records.forEach(function(record){
                    record.Link='/'+record.Id
                });
                component.set("v.data", records);
                console.log(records);
            }else{
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
    
    magicFilter : function(component, value){
        let action = component.get("c.getItemsByMagic");
        action.setParams({"value" : value});
        action.setCallback(this, function(response){
            let state = response.getState();
            if(state === "SUCCESS"){
                var records = response.getReturnValue();
                records.forEach(function(record){
                    record.Link='/'+record.Id
                });
                component.set("v.data", records);
                console.log(records);
            }else{
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    },
})