public with sharing class LeadTriggerHelper {
  public LeadTriggerHelper() {

  }
  List<AuditLead__c> logs = new List<AuditLead__c>();

  public  AuditLead__c insertLead(SObject objHelper) {
      AuditLead__c obj = new AuditLead__c();
      obj.ObjectId__c = objHelper.Id;
      obj.ChangeDate__c = Date.today();
      obj.Action__c = 'insert';
      obj.ConcernedObject__c = objHelper.getsobjecttype().getdescribe().getname();
      obj.ConcernedUser__c = UserInfo.getName();
      obj.User_ID__c = UserInfo.getUserId();
      return obj;
    }
    public void sendNotification(String action, String verbe) {
      List <AuditLead__c>lsss = [SELECT Id, ConcernedObject__c, ChangeDate__c from AuditLead__c 
      ORDER BY ChangeDate__c DESC];
      CustomNotificationType notificationType = 
      [SELECT Id
       FROM CustomNotificationType 
       WHERE DeveloperName='Lead_Notify'];
    
  
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
  public AuditLead__c updateHelper(
   SObject nv,
   SObject old,
   Map<String, Schema.SObjectField> mapFields
   ) {

    AuditLead__c obj = new AuditLead__c();
  for (String str : mapFields.keyset()) {
    if (
      nv.get(str) != old.get(str) 
      &&!(String.valueof(str).equals('lastmodifieddate')) &&
      !(String.valueof(str).equals('systemmodstamp'))
    ) {
      obj.Action__c = 'update';
      obj.ObjectId__c = (Id) old.get('Id');
      obj.Name = (String)old.get('Name');
      obj.User_ID__c = UserInfo.getUserId();
      obj.ConcernedUser__c = UserInfo.getName();
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
public AuditLead__c deleteLead(Lead objhlp) {
 
  AuditLead__c obj = new AuditLead__c();
  public_backup_data__x bcp = new public_backup_data__x();
  obj.ChangeDate__c = Date.today();
  obj.Action__c = 'delete';
  String IdObj= (Id) objhlp.get('Id');
  obj.ObjectId__c = IdObj;
  obj.ConcernedObject__c = objhlp.getsobjecttype().getdescribe().getname();
  obj.ConcernedUser__c = UserInfo.getName();
  obj.User_ID__c = UserInfo.getUserId();
  obj.is_deleted__c = true;
  List<AuditLead__c> ac = [SELECT Id FROM AuditLead__c WHERE
  ObjectId__c LIKE :IdObj];
  for (AuditLead__c c : ac){
    c.is_deleted__c = true;
  }
  DataBase.update(ac);
   
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
  DateTime dt = System.now();
  bcp.deleteDate__c = dt.Date();
  Database.insertAsync(bcp);
 
  return obj;
}
  
}
