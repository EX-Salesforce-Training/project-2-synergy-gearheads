({
	init : function(component, event, helper) {
        component.set('v.myColumns', [
            {label: 'Name', fieldName: 'Name', type: 'Text'},
            {label: 'Danger Level', fieldName: 'Danger_Level__c', type: 'Picklist'},
            {label: 'Location', fieldName: 'Location__c', type: 'Text'},
            {label: 'Requires Party?', fieldName: 'Requires_Party__c', type: 'Checkbox'},
            {label: 'Status', fieldName: 'Status__c', type: 'Picklist'}
        ]);
		
	}
})