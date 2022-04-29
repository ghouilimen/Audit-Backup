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
  @AuraEnabled(cacheable=true)
   public static List<public_backup_data__x> getCon( Date searchKey, String sortBy, String sortDirection) {

        Date lastday = Date.today();
        Date startday =  Date.today()-13 ;
      
       String query = 'SELECT     deleteDate__c  , ObjectId__c , ObjType__c  FROM public_backup_data__x where deleteDate__c <= :lastday and  deleteDate__c >= :Startday'  ;
       if (searchkey!=null && searchkey<Date.today()) {
        query += ' and  deleteDate__c=:searchkey';
       }
       if ( sortBy != null && sortDirection != null ) {
           query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
       }
       return Database.query( query );
     
   }
   @AuraEnabled(cacheable=true)
   public static List<AuditContact__c> getdeletedcon( String sortBy, String sortDirection) {

      String a ='delete';
      Date lastday = Date.today();
      Date startday =  Date.today()-13 ;
      
      List<AuditContact__c> ac = [SELECT   ChangeDate__c  , ObjectId__c , ConcernedObject__c  FROM AuditContact__c where Action__c LIKE :a and ChangeDate__c <= :lastday and  ChangeDate__c >= :Startday ] ;

   /* for (AuditContact__c c : ac){
      c.is_deleted__c = true;
    }
    DataBase.update(ac);  
        System.debug(Date.today());
       if ( sortBy != null && sortDirection != null ) {
           query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
       }*/
       return ac;
      }
  
    public BackupHelper() {   }
   
    
}
