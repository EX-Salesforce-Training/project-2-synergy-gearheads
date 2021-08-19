/*
 * *******************************************************
 * Title: userItemInfoController.js
 * Author: Dominic Romanello
 * Created: 8/16/21
 * LastModified: 8/16/21
 * LastModifiedBy: Dominic Romanello
 * Description: 
 * 
 ******************************************************** 
 */

({  
    init : function(component, event, helper) {
        
		component.set("v.columns", [
                              {label: "Item Name", fieldName: "Name", type:"String"},
            					{label: "Value", fieldName: "Value__c", type:"currency", typeAttributes:{currencyCode: 'USD'}},
                              {label: "Item Type", fieldName: "Item_Type__c", type: "Picklist"},
                              {label: "Properties", fieldName: "Properties__c", type:"String"}
                              
                              ]);
        let action = component.get("c.getItems");
        let memberId = component.get("v.memberId");
        action.setParams({"memberId" : memberId});
        
        action.setCallback(this, function(response){
            let state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.data", response.getReturnValue());
                console.log(response.getReturnValue());
                
            }else{
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
	}
})