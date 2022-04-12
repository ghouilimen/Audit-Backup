public with sharing class AuditCSV {
    public AuditCSV() {
    }
    @AuraEnabled
    public static void createAndSendCSVReport(){

        List<AuditContact__c> acc= new List<AuditContact__c>();
        acc=[SELECT User_ID__c, Action__c, 
        ChangeDate__c, ConcernedObject__c
        FROM AuditContact__c  ORDER BY ChangeDate__c];
        List<AuditContract__c> caa= new List<AuditContract__c>();
        caa=[SELECT User_ID__c, Action__c, 
        ChangeDate__c, ConcernedObject__c
        FROM AuditContract__c  ORDER BY ChangeDate__c];

        //Separating field values using comma and storing in a list of string-'accountDetails' 
        //The field values are displayed in different cells in CSV file when comma is encountered
        List<String> auditDetails = new List<String>();
        if(acc != NULL && !acc.isEmpty())
        {
            for(AuditContact__c accObj: acc)
            {
                auditDetails.add(accObj.User_ID__c + ',' + accObj.Action__c + ',' + accObj.ChangeDate__c + ',' + accObj.ConcernedObject__c );
            }
        }
        if(caa != NULL && !caa.isEmpty())
        {
            for(AuditContract__c accObj: caa)
            {
                auditDetails.add(accObj.User_ID__c + ',' + accObj.Action__c + ',' + accObj.ChangeDate__c + ',' + accObj.ConcernedObject__c );
            }
        }
        //Creating CSV file
        String csvFile;
        String csvColumnHeader = 'User, Action , Date , Object\n';
        List<String> csvRowValues = new List<String>();
        
        //To add an attachment, Messaging.EmailFileAttachment class is used
        Messaging.EmailFileAttachment attach;
        if(auditDetails != NULL && !auditDetails.isEmpty())
        {
            csvFile = csvColumnHeader + String.join(auditDetails,'\n');
            attach = new Messaging.EmailFileAttachment();
            attach.setContentType('text/csv');
            attach.setFileName('Audit File.csv');
            attach.setInline(true);
            attach.Body = Blob.valueOf(csvFile);
        }       
        
        //Creating recipient list
        List<String> recipientList = new List<String>();
        recipientList.add('imenghouil21@gmail.com');

        //Sending email and attaching the CSV file
        List<Messaging.SingleEmailMessage> mailsList = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(recipientList);
        mail.setSubject('List of Audits');
        String body = 'Votre audit de la semaine des donées Salesforce';
        mail.setHtmlBody(body);
        if(attach != NULL)
        {
            mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach });//Set File Attachment
        }
        mailsList.add(mail);
        Messaging.SendEmailResult[] sendEmailResults = Messaging.sendEmail(mailsList);
    }
}

