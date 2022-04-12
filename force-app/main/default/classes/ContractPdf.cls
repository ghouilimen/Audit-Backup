public with sharing class   ContractPdf {
    public List<AuditContract__c> Records {get; set;}
    
    public ContractPdf() {
        this.Records =  [
            SELECT User_ID__c, Action__c, 
            ChangeDate__c, ConcernedObject__c
            FROM AuditContract__c  ORDER BY ChangeDate__c ];
    }
    
    @AuraEnabled
    public static void sendReport() {
 
        string [] toaddress= New string[]{'imenghouil21@gmail.com'};
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.setToAddresses(toaddress);
        message.setSubject('Audit de la semaine ');
                            message.setsaveasactivity(false);

        message.setHtmlBody('Votre audit de la semaine des donées Salesforce');
        
     
        PageReference pdf = Page.ContractPdf;
            
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
