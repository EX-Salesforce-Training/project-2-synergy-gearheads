({

    previousPage : function(component, event, helper) {
    	let pageNum = component.get("v.pageNumber");
        if (pageNum > 0){
            pageNum = pageNum - 1;
            component.set("v.pageNumber", pageNum);
        }
	},

    nextPage : function(component, event, helper) {
    	let pageNum = component.get("v.pageNumber");
        let maxPage = component.get("v.maxPage");
        if (pageNum < maxPage){
            pageNum = pageNum + 1;
            component.set("v.pageNumber", pageNum);
        }
    }

})