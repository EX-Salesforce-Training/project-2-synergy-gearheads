({
    init : function (component, event, helper){
        component.set("v.potato", "CHANGED");
        helper.getFacilities(component, event, helper);
        helper.getParties(component, event, helper);
        helper.getQuests(component, event, helper);
    }
    
    
})