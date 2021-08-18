({
    getCurPage : function(component, event, helper){
		let pageName = component.get("v.pageTitle");
        
        if(pageName === "Guild Halls"){
            var action = component.get("c.getHalls");
        } else if (pageName === "Parties"){
            var action = component.get("c.getParties");
        } else if (pageName === "Quests"){
            var action = component.get("c.getQuests");
        } else {
            var action = component.get("c.getMembers");
        }
        action.setParams({"page": component.get("v.pageNumber")});
        action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS"){
                let records = response.getReturnValue();
                component.set("v.objectList", records);
            }
        });
        $A.enqueueAction(action);
    },
    
    getPageCount : function(component, event, helper){
        let pageName = component.get("v.pageTitle");
        
        let setCount = component.get("c.getPageCount");
        setCount.setParams({"pageTitle" : pageName});
        setCount.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS"){
                let finCount = response.getReturnValue();
                component.set("v.maxPage", finCount);
            }
        });  
        $A.enqueueAction(setCount);        
    },
})