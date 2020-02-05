global with sharing class UpdateLeadRecord implements Database.Batchable < sObject >{


global Database.QueryLocator start(Database.BatchableContext BC) {

  
        String query= 'SELECT Id, Sales_Group__c, Round_Robin__c FROM Lead WHERE Sales_Group__c = TRUE ORDER BY CreatedDate' ; 
        return Database.getQueryLocator(query);
}

global void execute(Database.BatchableContext BC, List<sObject> leads) {     
               
			Integer Count = 0;
		
		if(leads.size() > 0 && !leads.isEmpty()) {
			for(Lead l1 : (list<Lead>)leads ){
			
				if(Count > 9){
					Count = 0;			     
				}
				l1.Round_Robin__c = String.valueof(Count);
				Count++;
			}
			
			Database.update(leads,false);
		}		
}
       

global void finish(Database.BatchableContext BC) { }
}