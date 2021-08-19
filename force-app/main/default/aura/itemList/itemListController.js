/*
 ********************************************************
 * Title: itemListController.js
 * Author: Dominic Romanello
 * Created: 8/16/21
 * LastModified: 8/18/21
 * LastModifiedBy: Dominic Romanello
 * Description: 
 * 
 ******************************************************** 
*/
({
	init : function(component, event, helper) {
		helper.getAllItems(component);
	},
    
    selectItemType : function(component, event, helper) {
        let itemType = component.find("selectItemType").get("v.value");
        helper.filterItems(component, itemType);
    },
    
    selectByValue : function(component, event, helper){
        let selectedValue = component.find("selectValue").get("v.value");
        switch(selectedValue){
            case "lessThan5":
                var lower = 0;
                var upper = 500;
                break;
            case "5To5k":
                var lower = 500;
                var upper = 5000;
                break;
            case "5kTo10k":
                var lower = 5000;
                var upper = 10000;
                break;
            case "10kTo50k":
                var lower = 10000;
                var upper = 50000;
                break;
            case "above50k":
                var lower = 50000;
                var upper = 999999999;
                break;
        }
        helper.valueFilter(component, lower, upper);
    },
    
    selectByGuild : function(component, event, helper){
        let value = component.find("selectGuild").get("v.value");
        helper.guildFilter(component, value);
    },
    
    selectByMagic : function(component, event, helper){
        let value = component.find("selectMagic").get("v.value");
        helper.magicFilter(component, value);
    }
})