({
	ActivateItemPage : function(component, event, helper) {
		component.set("v.pageTitle", "Item List");
        component.set("v.pageNumber", "0");
        component.set("v.maxPage", "0");
	},
    
	ActivateGuildHall : function(component, event, helper) {
		component.set("v.pageTitle", "Guild Hall");
        component.set("v.pageNumber", "0");
        component.set("v.maxPage", "0");
	},

    ActivateParty : function(component, event, helper) {
		component.set("v.pageTitle", "Parties");
        component.set("v.objectType", "GuildHall");
        component.set("v.pageNumber", "0");
        component.set("v.maxPage", "0");
        console.log("it ran");
	},
	ActivateQuest : function(component, event, helper) {
		component.set("v.pageTitle", "Quests");
        component.set("v.objectType", "GuildHall");
        component.set("v.pageNumber", "0");
        component.set("v.maxPage", "0");
        console.log("it ran");
	},
	ActivateGuildMember : function(component, event, helper) {
		component.set("v.pageTitle", "Guild Members");
        component.set("v.objectType", "GuildHall");
        component.set("v.pageNumber", "0");
        component.set("v.maxPage", "0");
        console.log("it ran");
	},
    
})