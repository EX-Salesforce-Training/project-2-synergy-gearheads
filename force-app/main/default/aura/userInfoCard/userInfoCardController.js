/*
 * *******************************************************
 * Title: userInfoCardController.js
 * Author: Dominic Romanello
 * Created: 8/11/21
 * LastModified: 8/16/21
 * LastModifiedBy: Dominic Romanello
 * Description: 
 * 
 ******************************************************** 
 */

({
	doInit : function(component, event, helper) {
		let action = component.get("c.getMember");
        let memberId = component.get("v.memberId");
        action.setParams({"memberId" : memberId});
        
        action.setCallback(this, function(response){
            let state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.guildMember", response.getReturnValue());
                component.set("v.loaded", true);
                console.log("v.guildMember");
            }else{
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
	}
})