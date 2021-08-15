({
	onClick : function(component, event, helper) {
		let Contacts = component.get("c.getMyContacts");
        Contacts.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                component.set("v.contactIds", response.getReturnValue());
            }
        })
        $A.enqueueAction(Contacts);
    }
})