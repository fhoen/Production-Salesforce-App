trigger ProductionTrigger on Production__c (before insert,after insert, after update) {
	
	if(Trigger.isBefore){
		ProductionTriggerHandler.generateBarcode(Trigger.new);
	}
	if (Trigger.isAfter) {
		ProductionQuantityCalculation.Recalculate(Trigger.new);
	}

}