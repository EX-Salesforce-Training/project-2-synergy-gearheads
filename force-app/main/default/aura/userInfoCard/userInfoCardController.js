/*
 * *******************************************************
 * Title: userInfoCardController.js
 * Author: Dominic Romanello
 * Created: 8/11/21
 * LastModified: 8/11/21
 * LastModifiedBy: Dominic Romanello
 * Description: Handles the initialization of the page.
 * 
 ******************************************************** 
 */

({
	doInit : function(component, event, helper) {
		let action = component.get("c.getMember");
        let member = component.get("v.member");
        action.setParams({"member" : member});
        
        action.setCallback(this, function(response){
            let state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.guildMember", response.getReturnValue());
                console.log(response.getReturnValue());
            }else{
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
	}
})