public with sharing class BackupHelper {

  @AuraEnabled
  public static void BackupContact(AuditContact__c sObj) {

    public_backup_data__x objToBackup = new public_backup_data__x();
    List<public_backup_data__x> StoredObj = [SELECT deleteDate__c, prvkey__c, ObjectId__c, deletedObj__c , ObjType__c 
           FROM public_backup_data__x  ] ;
  
    for (public_backup_data__x ob : StoredObj) {
      if (ob.ObjectId__c == sObj.ObjectId__c && ob.ObjType__c.equals('Contact'))
        objToBackup = ob;
        System.debug(objToBackup);
    }

    Blob data = EncodingUtil.base64Decode(objToBackup.deletedobj__c);
    Blob privateKey = EncodingUtil.base64Decode(objToBackup.prvkey__c);
    Blob decryptedData = Crypto.decryptWithManagedIV(
      'AES128',
      privateKey,
      data
    );

    // Decode the decrypted data 
    String decryptedDataString = decryptedData.toString();
    sObject objs = (sObject) JSON.deserialize(
      decryptedDataString,
      sObject.class
    );
    String id = objs.Id;
    objs.Id = null;
    List<sObject> ls = new List<sObject>();
    ls.add(objs);
    insert(ls);
    List<AuditContact__c> lssList = new  List<AuditContact__c>();
    List<AuditContact__c> lss = [SELECT Id FROM AuditContact__c WHERE
    ObjectId__c LIKE :id];
    for (AuditContact__c c : lss){
      c.is_deleted__C = false;
      lssList.add(c);
    }
    DataBase.update(lssList);
    Database.delete(sObj);
  }
  @AuraEnabled
  public static void BackupContract(AuditContract__c sObj) {

    public_backup_data__x objToBackup = new public_backup_data__x();
    List<public_backup_data__x> StoredObj = [SELECT deleteDate__c, prvkey__c, ObjectId__c, deletedObj__c , ObjType__c 
           FROM public_backup_data__x  ] ;
  
    for (public_backup_data__x ob : StoredObj) {
      if (ob.ObjectId__c == sObj.ObjectId__c && ob.ObjType__c.equals('Contract'))
        objToBackup = ob;
        System.debug(objToBackup);
    }

    Blob data = EncodingUtil.base64Decode(objToBackup.deletedobj__c);
    Blob privateKey = EncodingUtil.base64Decode(objToBackup.prvkey__c);
    Blob decryptedData = Crypto.decryptWithManagedIV(
      'AES128',
      privateKey,
      data
    );

    // Decode the decrypted data 
    String decryptedDataString = decryptedData.toString();
    sObject objs = (sObject) JSON.deserialize(
      decryptedDataString,
      sObject.class
    );
    String id = objs.Id;
    objs.Id = null;
    List<sObject> ls = new List<sObject>();
    ls.add(objs);
    insert(ls);
    List<AuditContract__c> lssList = new  List<AuditContract__c>();
    List<AuditContract__c> lss = [SELECT Id FROM AuditContract__c WHERE
    ObjectId__c LIKE :id];
    for (AuditContract__c c : lss){
      c.is_deleted__C = false;
      lssList.add(c);
    }
    DataBase.update(lssList);
    Database.delete(sObj);
  }
  @AuraEnabled
  public static void BackupLead(AuditLead__c sObj) {

    public_backup_data__x objToBackup = new public_backup_data__x();
    List<public_backup_data__x> StoredObj = [SELECT deleteDate__c, prvkey__c, ObjectId__c, deletedObj__c , ObjType__c 
           FROM public_backup_data__x  ] ;
  
    for (public_backup_data__x ob : StoredObj) {
      if (ob.ObjectId__c == sObj.ObjectId__c && ob.ObjType__c.equals('Lead'))
        objToBackup = ob;
        System.debug(objToBackup);
    }

    Blob data = EncodingUtil.base64Decode(objToBackup.deletedobj__c);
    Blob privateKey = EncodingUtil.base64Decode(objToBackup.prvkey__c);
    Blob decryptedData = Crypto.decryptWithManagedIV(
      'AES128',
      privateKey,
      data
    );

    // Decode the decrypted data 
    String decryptedDataString = decryptedData.toString();
    sObject objs = (sObject) JSON.deserialize(
      decryptedDataString,
      sObject.class
    );
    String id = objs.Id;
    objs.Id = null;
    List<sObject> ls = new List<sObject>();
    ls.add(objs);
    insert(ls);
    List<AuditLead__c> lssList = new  List<AuditLead__c>();
    List<AuditLead__c> lss = [SELECT Id FROM AuditLead__c WHERE
    ObjectId__c LIKE :id];
    for (AuditLead__c c : lss){
      c.is_deleted__C = false;
      lssList.add(c);
    }
    DataBase.update(lssList);
    Database.delete(sObj);
  }
  @AuraEnabled
  public static void BackupOpp(AuditOpportunity__c sObj) {

    public_backup_data__x objToBackup = new public_backup_data__x();
    List<public_backup_data__x> StoredObj = [SELECT deleteDate__c, prvkey__c, ObjectId__c, deletedObj__c , ObjType__c 
           FROM public_backup_data__x  ] ;
  
    for (public_backup_data__x ob : StoredObj) {
      if (ob.ObjectId__c == sObj.ObjectId__c && ob.ObjType__c.equals('Opportunity'))
        objToBackup = ob;
        System.debug(objToBackup);
    }

    Blob data = EncodingUtil.base64Decode(objToBackup.deletedobj__c);
    Blob privateKey = EncodingUtil.base64Decode(objToBackup.prvkey__c);
    Blob decryptedData = Crypto.decryptWithManagedIV(
      'AES128',
      privateKey,
      data
    );

    // Decode the decrypted data 
    String decryptedDataString = decryptedData.toString();
    sObject objs = (sObject) JSON.deserialize(
      decryptedDataString,
      sObject.class
    );
    String id = objs.Id;
    objs.Id = null;
    List<sObject> ls = new List<sObject>();
    ls.add(objs);
    insert(ls);
    List<AuditOpportunity__c> lssList = new  List<AuditOpportunity__c>();
    List<AuditOpportunity__c> lss = [SELECT Id FROM AuditOpportunity__c WHERE
    ObjectId__c LIKE :id];
    for (AuditOpportunity__c c : lss){
      c.is_deleted__C = false;
      lssList.add(c);
    }
    DataBase.update(lssList);
    Database.delete(sObj);
  }
  @AuraEnabled
  public static void BackupAcc(AuditAccount__c sObj) {

    public_backup_data__x objToBackup = new public_backup_data__x();
    List<public_backup_data__x> StoredObj = [SELECT deleteDate__c, prvkey__c, ObjectId__c, deletedObj__c , ObjType__c 
           FROM public_backup_data__x  ] ;
  
    for (public_backup_data__x ob : StoredObj) {
      if (ob.ObjectId__c == sObj.ObjectId__c && ob.ObjType__c.equals('Account'))
        objToBackup = ob;
        System.debug(objToBackup);
    }

    Blob data = EncodingUtil.base64Decode(objToBackup.deletedobj__c);
    Blob privateKey = EncodingUtil.base64Decode(objToBackup.prvkey__c);
    Blob decryptedData = Crypto.decryptWithManagedIV(
      'AES128',
      privateKey,
      data
    );

    // Decode the decrypted data 
    String decryptedDataString = decryptedData.toString();
    sObject objs = (sObject) JSON.deserialize(
      decryptedDataString,
      sObject.class
    );
    String id = objs.Id;
    objs.Id = null;
    List<sObject> ls = new List<sObject>();
    ls.add(objs);
    insert(ls);
    List<AuditAccount__c> lssList = new  List<AuditAccount__c>();
    List<AuditAccount__c> lss = [SELECT Id FROM AuditAccount__c WHERE
    ObjectId__c LIKE :id];
    for (AuditAccount__c c : lss){
      c.is_deleted__C = false;
      lssList.add(c);
    }
    DataBase.update(lssList);
    Database.delete(sObj);
  }
  @AuraEnabled
  public static void BackupPro(AuditProduct__c sObj) {

    public_backup_data__x objToBackup = new public_backup_data__x();
    List<public_backup_data__x> StoredObj = [SELECT deleteDate__c, prvkey__c, ObjectId__c, deletedObj__c , ObjType__c 
           FROM public_backup_data__x  ] ;
  
    for (public_backup_data__x ob : StoredObj) {
      if (ob.ObjectId__c == sObj.ObjectId__c && ob.ObjType__c.equals('Product2'))
        objToBackup = ob;
    }

    Blob data = EncodingUtil.base64Decode(objToBackup.deletedobj__c);
    Blob privateKey = EncodingUtil.base64Decode(objToBackup.prvkey__c);
    Blob decryptedData = Crypto.decryptWithManagedIV(
      'AES128',
      privateKey,
      data
    );

    // Decode the decrypted data 
    String decryptedDataString = decryptedData.toString();
    sObject objs = (sObject) JSON.deserialize(
      decryptedDataString,
      sObject.class
    );
    String id = objs.Id;
    objs.Id = null;
    List<sObject> ls = new List<sObject>();
    ls.add(objs);
    insert(ls);
    List<AuditProduct__c> lssList = new  List<AuditProduct__c>();
    List<AuditProduct__c> lss = [SELECT Id FROM AuditProduct__c WHERE
    ObjectId__c LIKE :id];
    for (AuditProduct__c c : lss){
      c.is_deleted__C = false;
      lssList.add(c);
    }
    DataBase.update(lssList);
    Database.delete(sObj);
  }
  @AuraEnabled
    public static void RollBackUpdatepro(AuditProduct__c sObj){
       
      Map<Id, String> idsToUpdate = new Map<Id,String>();
      Map<Id, Boolean> idsToUpdatee = new Map<Id,Boolean>();
        if(sObj.ConcernedField__c == 'IsActive'){
          idsToUpdatee.put((Id)sObj.ObjectId__c, Boolean.valueOf(sObj.OldValue__c) );
          List<Product2> sObjectsToUpdate = new List<Product2>();
          for (Id idToUpdate : idsToUpdatee.keySet()) {
              Product2 o1 = new Product2(Id = idToUpdate);
              o1.put(sObj.ConcernedField__c, idsToUpdatee.get(idToUpdate));
              sObjectsToUpdate.add(o1);
          }
          update sObjectsToUpdate;
          delete(sObj);
        }
        else{
          idsToUpdate.put((Id)sObj.ObjectId__c, sObj.OldValue__c );
          List<Product2> sObjectsToUpdate = new List<Product2>();
          for (Id idToUpdate : idsToUpdate.keySet()) {
              Product2 o1 = new Product2(Id = idToUpdate);
              o1.put(sObj.ConcernedField__c, idsToUpdate.get(idToUpdate));
              sObjectsToUpdate.add(o1);
          }
          update sObjectsToUpdate;
          delete(sObj);
        }
    }
    @AuraEnabled
    public static void RollBackUpdateopp(AuditOpportunity__c sObj){
      Map<Id, String> idsToUpdate = new Map<Id,String>();
      Map<Id, Decimal> idsToUpdatee = new Map<Id,Decimal>();
        if(sObj.ConcernedField__c == 'amount'){
          idsToUpdatee.put((Id)sObj.ObjectId__c, Decimal.valueOf(sObj.OldValue__c) );
          List<Opportunity> sObjectsToUpdate = new List<Opportunity>();
          for (Id idToUpdate : idsToUpdatee.keySet()) {
              Opportunity o1 = new Opportunity(Id = idToUpdate);
              o1.put(sObj.ConcernedField__c, idsToUpdatee.get(idToUpdate));
              sObjectsToUpdate.add(o1);
          }
          update sObjectsToUpdate;
          delete(sObj);
        }
        else{
          idsToUpdate.put((Id)sObj.ObjectId__c, sObj.OldValue__c );
          List<Opportunity> sObjectsToUpdate = new List<Opportunity>();
          for (Id idToUpdate : idsToUpdate.keySet()) {
              Opportunity o1 = new Opportunity(Id = idToUpdate);
              o1.put(sObj.ConcernedField__c, idsToUpdate.get(idToUpdate));
              sObjectsToUpdate.add(o1);
          }
          update sObjectsToUpdate;
          delete(sObj);
        }
 
    }
    @AuraEnabled
    public static void RollBackUpdatelead(AuditLead__c sObj){
      Map<Id, String> idsToUpdate = new Map<Id, String>();
      idsToUpdate.put((Id)sObj.ObjectId__c, sObj.OldValue__c);
          List<Lead> sObjectsToUpdate = new List<Lead>();
          for (Id idToUpdate : idsToUpdate.keySet()) {
              Lead o1 = new Lead(Id = idToUpdate);
              o1.put(sObj.ConcernedField__c, idsToUpdate.get(idToUpdate));
              sObjectsToUpdate.add(o1);
          }
          update sObjectsToUpdate;
          delete(sObj);
    }
    @AuraEnabled
    public static void RollBackUpdateContact(AuditContact__c sObj){
      Map<Id, String> idsToUpdate = new Map<Id,String>();
      Map<Id, Date> idsToUpdatee = new Map<Id,Date>();
        if(sObj.ConcernedField__c == 'Birthdate'){
          idsToUpdatee.put((Id)sObj.ObjectId__c, Date.valueOf(sObj.OldValue__c) );
          List<Contact> sObjectsToUpdate = new List<Contact>();
          for (Id idToUpdate : idsToUpdatee.keySet()) {
              Contact o1 = new Contact(Id = idToUpdate);
              o1.put(sObj.ConcernedField__c, idsToUpdatee.get(idToUpdate));
              sObjectsToUpdate.add(o1);
          }
          update sObjectsToUpdate;
          delete(sObj); 
        }
        else{
          idsToUpdate.put((Id)sObj.ObjectId__c, sObj.OldValue__c );
          List<Contact> sObjectsToUpdate = new List<Contact>();
          for (Id idToUpdate : idsToUpdate.keySet()) {
              Contact o1 = new Contact(Id = idToUpdate);
              o1.put(sObj.ConcernedField__c, idsToUpdate.get(idToUpdate));
              sObjectsToUpdate.add(o1);
          }
          update sObjectsToUpdate;
          delete(sObj);
        }
    }
    @AuraEnabled
    public static void RollBackUpdateContract(AuditContract__c sObj){
      Map<Id, String> idsToUpdate = new Map<Id,String>();
      Map<Id, Date> idsToUpdatee = new Map<Id,Date>();
        if(sObj.ConcernedField__c == 'StartDate'){
          idsToUpdatee.put((Id)sObj.ObjectId__c, Date.valueOf(sObj.OldValue__c) );
          List<Contract> sObjectsToUpdate = new List<Contract>();
          for (Id idToUpdate : idsToUpdatee.keySet()) {
              Contract o1 = new Contract(Id = idToUpdate);
              o1.put(sObj.ConcernedField__c, idsToUpdatee.get(idToUpdate));
              sObjectsToUpdate.add(o1);
          }
          update sObjectsToUpdate;
          delete(sObj);
        }
        else{
          idsToUpdate.put((Id)sObj.ObjectId__c, sObj.OldValue__c );
          List<Contract> sObjectsToUpdate = new List<Contract>();
          for (Id idToUpdate : idsToUpdate.keySet()) {
              Contract o1 = new Contract(Id = idToUpdate);
              o1.put(sObj.ConcernedField__c, idsToUpdate.get(idToUpdate));
              sObjectsToUpdate.add(o1);
          }
          update sObjectsToUpdate;
          delete(sObj);
        }
    }
  @AuraEnabled
    public static void RollBackUpdateAcc(AuditAccount__c sObj){
      Map<Id, String> idsToUpdate = new Map<Id,String>();
      Map<Id, Decimal> idsToUpdatee = new Map<Id,Decimal>();
      Map<Id, Url > idsToUpdateee = new Map<Id,Url>();
      
        if(sObj.ConcernedField__c == 'AnnualRevenue'){
          idsToUpdatee.put((Id)sObj.ObjectId__c, Decimal.valueOf(sObj.OldValue__c) );
          List<Account> sObjectsToUpdate = new List<Account>();
          for (Id idToUpdate : idsToUpdatee.keySet()) {
              Account o1 = new Account(Id = idToUpdate);
              o1.put(sObj.ConcernedField__c, idsToUpdatee.get(idToUpdate));
              sObjectsToUpdate.add(o1);
          }
          update sObjectsToUpdate;
          delete(sObj);
        }
        else{
          idsToUpdate.put((Id)sObj.ObjectId__c, sObj.OldValue__c );
          List<Account> sObjectsToUpdate = new List<Account>();
          for (Id idToUpdate : idsToUpdate.keySet()) {
              Account o1 = new Account(Id = idToUpdate);
              o1.put(sObj.ConcernedField__c, idsToUpdate.get(idToUpdate));
              sObjectsToUpdate.add(o1);
          }
          update sObjectsToUpdate;
          delete(sObj);
        }
    }
  
  
    public BackupHelper() {   }
   
    
}
