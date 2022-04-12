public with sharing class ContactTriggerHelper {
    public ContactTriggerHelper() {

    }
    List<AuditContact__c> logs = new List<AuditContact__c>();

    public  AuditContact__c insertContact(SObject objhlp) {
        AuditContact__c obj = new AuditContact__c();
        obj.ObjectId__c = objhlp.Id;
        obj.ChangeDate__c = Date.today();
        obj.Action__c = 'insert';
        obj.ConcernedObject__c = objhlp.getsobjecttype().getdescribe().getname();
        obj.ConcernedUser__c = UserInfo.getName();
        obj.User_ID__c = UserInfo.getUserId();

        return obj;
      }
      public void sendNotification(String action, String verbe) {
        List <AuditContact__c>lsss = [SELECT Id, ConcernedObject__c, ChangeDate__c from AuditContact__c 
        ORDER BY ChangeDate__c DESC];
        CustomNotificationType notificationType = 
        [SELECT Id
         FROM CustomNotificationType 
         WHERE DeveloperName='Contact_Notify'];
      
    
        // Create a new custom notification
        Messaging.CustomNotification notification = new Messaging.CustomNotification();
    
        // Set the contents for the notification
        notification.setTitle(action);
        notification.setBody(
          UserInfo.getName() +
          ' has '+verbe +' an ' +
          lsss[0].ConcernedObject__c
        );
    
        // Set the notification type and target
        notification.setNotificationTypeId(notificationType.Id);
        notification.setTargetId(lsss[0].Id);
    
        try {
          notification.send(new Set<String>{UserInfo.getUserId()});
        } catch (Exception e) {
          System.debug('Problem sending notification: ' + e.getMessage());
        }
      }
    public AuditContact__c updateHelper(
     SObject nv,
     SObject old,
     Map<String, Schema.SObjectField> mapFields
     ) {

      AuditContact__c obj = new AuditContact__c();
    for (String str : mapFields.keyset()) {
      if (
        nv.get(str) != old.get(str) 
        &&!(String.valueof(str).equals('lastmodifieddate')) &&
        !(String.valueof(str).equals('systemmodstamp'))
      ) {
        obj.Action__c = 'update';
        obj.ObjectId__c = (Id) old.get('Id');
        obj.Name = (String)old.get('Name');
        obj.ConcernedUser__c = UserInfo.getName();
        obj.User_ID__c = UserInfo.getUserId();
        obj.ConcernedObject__c = nv.getsobjecttype().getdescribe().getname();
        obj.ConcernedField__c = String.valueof(str);
        obj.OldValue__c = String.valueof(old.get(str));
        obj.NewValue__c = String.valueof(nv.get(str));
        obj.ChangeDate__c = Date.today();
        return obj;
      }
    }
   
    return obj;
 
  }
  public AuditContact__c deleteContact(Contact objhlp) {
   
    AuditContact__c obj = new AuditContact__c();
    public_backup_data__x bcp = new public_backup_data__x();
    obj.ChangeDate__c = Date.today();
    obj.Action__c = 'delete';
    String IdObj= (Id) objhlp.get('Id');
    obj.ObjectId__c = IdObj;
    obj.ConcernedObject__c = objhlp.getsobjecttype().getdescribe().getname();
    obj.ConcernedUser__c = UserInfo.getName();
    obj.User_ID__c = UserInfo.getUserId();
    obj.is_deleted__c = true;
    List<AuditContact__c> ac = [SELECT Id FROM AuditContact__c WHERE
    ObjectId__c LIKE :IdObj];
    for (AuditContact__c c : ac){
      c.is_deleted__c = true;
    }
    DataBase.update(ac);
   // bcp=(public_contact1__x)objhlp;
     
    Blob Key = Crypto.generateAesKey(128);
    Blob data = Blob.valueOf(String.valueOf(JSON.serialize(objhlp)));
    Blob encrypted = Crypto.encryptWithManagedIV('AES128', Key, data);
    String encData = EncodingUtil.base64Encode(encrypted);
  //  System.debug(encData);
    String enckey = EncodingUtil.base64Encode(Key);
    bcp.deletedobj__c =encData; 
    bcp.ObjectId__c = (Id) objhlp.get('Id');
    bcp.prvkey__c = enckey; 
    bcp.ObjType__c =objhlp.getsobjecttype().getdescribe().getname();
    bcp.deleteDate__c = Date.today();
    Database.insertAsync(bcp);
   
    return obj;
  }
    
}
