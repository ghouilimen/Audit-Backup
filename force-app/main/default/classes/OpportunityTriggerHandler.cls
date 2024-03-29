public with sharing class OpportunityTriggerHandler implements ITrigger {

    OpportunityTriggerHelper hp= new OpportunityTriggerHelper();
    List<Opportunity> newItems = (List<Opportunity>) Trigger.new;
    List<Opportunity> oldItems = (List<Opportunity>) Trigger.old;

    List<AuditOpportunity__c> loggs = new List<AuditOpportunity__c>();



    public OpportunityTriggerHandler() {  }
    public void bulkBefore() {
        if(trigger.isInsert) {
        //Here we will call before insert actions
        //Here we will call after insert actions
       
        }
    }
        
        
    public void bulkAfter() {
        if(trigger.isInsert) {
            
    
            for (Opportunity c : newItems) {
                
                loggs.add(hp.insertOpportunity(c));}
        
              
              if (Schema.sObjectType.Opportunity.iscreateable()) {
                insert(loggs);
                hp.sendNotification('Insert', 'inserted');
            
            }
        
        } 
        else if(trigger.isUpdate) {
        //Here we will call after update actions

            Map<String, Schema.SObjectField> mapFields = Schema.SObjectType.Opportunity.fields.getMap();
            for (Opportunity gpl : newItems) {
              Opportunity oldGPL = (Opportunity)Trigger.oldMap.get(gpl.Id);
              loggs.add(hp.updateHelper(gpl, oldGPL, mapFields));
            }
            if (Schema.sObjectType.Opportunity.iscreateable()) { 
                insert(loggs);
                hp.sendNotification('Update','updated');
                
            }

        } else if(trigger.isDelete) {
        //Here we will call after delete actions
        for (Opportunity c : oldItems) {
            loggs.add(hp.deleteOpportunity(c));
          }
          insert(loggs);
          hp.sendNotification('Delete','deleted');
        } else if(trigger.isUndelete) {
        //Here we will call after undelete actions
        }
        }
      
    }