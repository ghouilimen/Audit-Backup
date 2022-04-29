public with sharing class AuditPdf {
    public List<AuditContact__c> Records {get; set;}
    public List<AuditContract__c> contracts {get; set;}
    public List<AuditLead__c> Leads {get; set;}
    public List<AuditProduct__c> Products {get; set;}
    public List<AuditOpportunity__c> Opportunities {get; set;}
    public List<AuditAccount__c> Accounts {get; set;}

    public AuditPdf() {
        this.Records =  [
            SELECT User_ID__c, Action__c, 
            ChangeDate__c, ConcernedObject__c
            FROM AuditContact__c  ORDER BY ChangeDate__c ];
        this.contracts =  [
                SELECT User_ID__c, Action__c, 
                ChangeDate__c, ConcernedObject__c
                FROM AuditContract__c  ORDER BY ChangeDate__c ]; 
        this.Leads =  [
                SELECT User_ID__c, Action__c, 
                ChangeDate__c, ConcernedObject__c
                FROM AuditLead__c  ORDER BY ChangeDate__c ]; 
        this.Products =  [
                SELECT User_ID__c, Action__c, 
                ChangeDate__c, ConcernedObject__c
                FROM AuditProduct__c  ORDER BY ChangeDate__c ]; 
        this.Opportunities =  [
                SELECT User_ID__c, Action__c, 
                ChangeDate__c, ConcernedObject__c
                FROM AuditOpportunity__c  ORDER BY ChangeDate__c ]; 
        this.Accounts =  [
                SELECT User_ID__c, Action__c, 
                ChangeDate__c, ConcernedObject__c
                FROM AuditAccount__c  ORDER BY ChangeDate__c ];                     
    }
    @Future(callout=true)
    @AuraEnabled
    public static void sendReport() {
 
        string [] toaddress= New string[]{'imenghouil21@gmail.com'};
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.setToAddresses(toaddress);
        message.setSubject('Audit de la semaine ');
        message.setsaveasactivity(false);

        message.setHtmlBody('Votre audit de la semaine des donées Salesforce');
        
     
        PageReference pdf = Page.AuditPdf;
            
        Blob reportPdf;
        try {
            reportPdf = pdf.getContentAsPDF();
        }
        catch (Exception e) {
            reportPdf = Blob.valueOf(e.getMessage());
        }
        
        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        attachment.setContentType('application/pdf');
        attachment.setFileName('Audit : '+system.today().format());
        attachment.setInline(false);
        attachment.setBody(reportPdf);
        message.setFileAttachments(new Messaging.EmailFileAttachment[]{ attachment });
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{ message });
        
    }
}
