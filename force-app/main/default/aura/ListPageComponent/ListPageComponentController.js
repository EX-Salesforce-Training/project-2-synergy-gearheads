({
	init : function(component, event, helper) {
        component.set("v.objectList", "sobjectType[]");
        component.set("v.pageNumber", "0");
		helper.getPageCount(component, event, helper);
        helper.getCurPage(component, event, helper);
	},

    pageRefresh : function(component, event, helper){
        component.set("v.objectList", "sobjectType[]");
		helper.getPageCount(component, event, helper);
        helper.getCurPage(component, event, helper);        
    },
    
    whenClicked : function(component, event, helper){
        var id_str = event.currentTarget.dataset.value;
        var name_str = event.currentTarget.dataset.name;
        component.set("v.recordId", id_str);
        component.set("v.recordName", name_str);
    },
    
    prevPage : function(component, event, helper){
        let pageNumber = component.get("v.pageNumber");
        if(pageNumber > 0){
            pageNumber = pageNumber - 1;
            component.set("v.pageNumber", pageNumber);
        }
    },
    
    nextPage : function(component, event, helper){
        let pageNumber = parseInt(component.get("v.pageNumber"));
        let maxPage = component.get("v.maxPage");
        if (pageNumber < maxPage){
            pageNumber = pageNumber + 1;
            component.set("v.pageNumber", pageNumber);
        }
    }
    
})