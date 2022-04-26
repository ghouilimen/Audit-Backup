public with sharing class AuditActions {
    public AuditActions() {} 

@AuraEnabled(cacheable=true)
public static Integer getInsertContact() {
    return [
      SELECT COUNT()
      FROM AuditContact__c
      WHERE Action__c IN ('insert') 
    ];
  }
@AuraEnabled(cacheable=true)
public static Integer getUpdateContact() {
    return [
      SELECT COUNT()
      FROM AuditContact__c
      WHERE Action__c IN ('update') 
    ];
  }
@AuraEnabled(cacheable=true)
public static Integer getDeleteContact() {
    return [
      SELECT COUNT()
      FROM AuditContact__c
      WHERE Action__c IN ('delete') 
    ];
  }
@AuraEnabled(cacheable=true)
public static Map<String, Integer> getContactActions() {
    Map<String, Integer> m1 = new Map<String, Integer>();
    
    m1.put('Insert', getInsertContact());
    m1.put('Update', getUpdateContact());
    m1.put('Delete', getDeleteContact());
    system.debug(m1);
    
    return m1;
  }
@AuraEnabled(cacheable=true)
public static Integer getInsertAccount() {
    return [
      SELECT COUNT()
      FROM AuditAccount__c
      WHERE Action__c IN ('insert') 
    ];
  }
@AuraEnabled(cacheable=true)
public static Integer getUpdateAccount() {
    return [
      SELECT COUNT()
      FROM AuditAccount__c
      WHERE Action__c IN ('update') 
    ];
  }
@AuraEnabled(cacheable=true)
public static Integer getDeleteAccount() {
    return [
      SELECT COUNT()
      FROM AuditAccount__c
      WHERE Action__c IN ('delete') 
    ];
  }
@AuraEnabled(cacheable=true)
public static Map<String, Integer> getAccountActions() {
    Map<String, Integer> m1 = new Map<String, Integer>();
    
    m1.put('Insert', getInsertAccount());
    m1.put('Update', getUpdateAccount());
    m1.put('Delete', getDeleteAccount());
    system.debug(m1);
    
    return m1;
  }
@AuraEnabled(cacheable=true)
public static Integer getInsertLead() {
      return [
        SELECT COUNT()
        FROM AuditLead__c
        WHERE Action__c IN ('insert') 
      ];
    }
@AuraEnabled(cacheable=true)
public static Integer getUpdateLead() {
      return [
        SELECT COUNT()
        FROM AuditLead__c
        WHERE Action__c IN ('update') 
      ];
    }
@AuraEnabled(cacheable=true)
public static Integer getDeleteLead() {
      return [
        SELECT COUNT()
        FROM AuditLead__c
        WHERE Action__c IN ('delete') 
      ];
    }
@AuraEnabled(cacheable=true)
public static Map<String, Integer> getLeadActions() {
      Map<String, Integer> m1 = new Map<String, Integer>();
      
      m1.put('Insert', getInsertLead());
      m1.put('Update', getUpdateLead());
      m1.put('Delete', getDeleteLead());
      system.debug(m1);
      
      return m1;
    }
@AuraEnabled(cacheable=true)
public static Integer getInsertProduct() {
        return [
          SELECT COUNT()
          FROM AuditProduct__c
          WHERE Action__c IN ('insert') 
        ];
      }
@AuraEnabled(cacheable=true)
    public static Integer getUpdateProduct() {
        return [
          SELECT COUNT()
          FROM AuditProduct__c
          WHERE Action__c IN ('update') 
        ];
      }
@AuraEnabled(cacheable=true)
public static Integer getDeleteProduct() {
        return [
          SELECT COUNT()
          FROM AuditProduct__c
          WHERE Action__c IN ('delete') 
        ];
      }
@AuraEnabled(cacheable=true)
public static Map<String, Integer> getProductActions() {
        Map<String, Integer> m1 = new Map<String, Integer>();
        
        m1.put('Insert', getInsertProduct());
        m1.put('Update', getUpdateProduct());
        m1.put('Delete', getDeleteProduct());
        system.debug(m1);
        
        return m1;
      }
@AuraEnabled(cacheable=true)
public static Integer getInsertContract() {
          return [
            SELECT COUNT()
            FROM AuditContract__c
            WHERE Action__c IN ('insert') 
          ];
        }
@AuraEnabled(cacheable=true)
public static Integer getUpdateContract() {
          return [
            SELECT COUNT()
            FROM AuditContract__c
            WHERE Action__c IN ('update') 
          ];
        }
@AuraEnabled(cacheable=true)
public static Integer getDeleteContract() {
          return [
            SELECT COUNT()
            FROM AuditContract__c
            WHERE Action__c IN ('delete') 
          ];
        }
@AuraEnabled(cacheable=true)
public static Map<String, Integer> getContractActions() {
          Map<String, Integer> m1 = new Map<String, Integer>();
          
          m1.put('Insert', getInsertContract());
          m1.put('Update', getUpdateContract());
          m1.put('Delete', getDeleteContract());
          system.debug(m1);
          
          return m1;
        }
@AuraEnabled(cacheable=true)
public static Integer getInsertOpportunity() {
            return [
              SELECT COUNT()
              FROM AuditOpportunity__c
              WHERE Action__c IN ('insert') 
            ];
          }
@AuraEnabled(cacheable=true)
public static Integer getUpdateOpportunity() {
            return [
              SELECT COUNT()
              FROM AuditOpportunity__c
              WHERE Action__c IN ('update') 
            ];
          }
@AuraEnabled(cacheable=true)
public static Integer getDeleteOpportunity() {
            return [
              SELECT COUNT()
              FROM AuditOpportunity__c
              WHERE Action__c IN ('delete') 
            ];
          }
@AuraEnabled(cacheable=true)
public static Map<String, Integer> getOpportunityActions() {
           Map<String, Integer> m1 = new Map<String, Integer>();
            
            m1.put('Insert', getInsertOpportunity());
            m1.put('Update', getUpdateOpportunity());
            m1.put('Delete', getDeleteOpportunity());
            system.debug(m1);
            
            return m1;
          }

@AuraEnabled(cacheable=true)
public static Integer countOpportunityactions() {
  return ( getDeleteOpportunity() + getInsertOpportunity() + getUpdateOpportunity());
                    }
@AuraEnabled(cacheable=true)
public static Integer countLeadactions() {
  return ( getDeleteLead() + getInsertLead() + getUpdateLead());
                    }
@AuraEnabled(cacheable=true)
public static Integer countContactactions() {
  return ( getDeleteContact() + getInsertContact() + getUpdateContact());
}
@AuraEnabled(cacheable=true)
public static Integer countContractactions() {
  return ( getDeleteContract() + getInsertContract() + getUpdateContract());
}
@AuraEnabled(cacheable=true)
public static Integer countProductactions() {
  return ( getDeleteProduct() + getInsertProduct() + getUpdateProduct());
}
@AuraEnabled(cacheable=true)
public static Integer countAccountactions() {
            return ( getDeleteAccount() + getInsertAccount() + getUpdateAccount());
}

@AuraEnabled(cacheable=true)
public static List<String> getActions() {
           List<String> m = new List<String>();
            
            m.add('Contact ');
            m.add('Contract');
            m.add('Lead ');
            m.add('Opportunity');
            m.add('Account ');
            m.add('Product ');
            m.add(String.valueOf(countContactactions()));
            m.add(String.valueOf(countContractactions()));
            m.add(String.valueOf(countLeadactions()));
            m.add(String.valueOf(countOpportunityactions()));
            m.add(String.valueOf(countAccountactions()));
            m.add(String.valueOf(countProductactions()));
            system.debug(m);
            
            return m;
          }

    @AuraEnabled(cacheable=true)
   public static List<AuditContact__c> getCon( String searchKey, String sortBy, String sortDirection) {
  
      
       String query = 'SELECT   ConcernedUser__c  , ChangeDate__c  , ObjectId__c , Action__c,  OldValue__c , ConcernedField__c , NewValue__c  FROM AuditContact__c '  ;
       if ( searchKey != null && searchKey != '' ) {
           String key = '%' + searchKey + '%'; 
           query += ' WHERE  Action__c LIKE :key';
       }
       if ( sortBy != null && sortDirection != null ) {
           query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
       }
       return Database.query( query );
     
   }
   @AuraEnabled(cacheable=true)
   public static List<AuditAccount__c> getAcc( String searchKey, String sortBy, String sortDirection) {
  
      
       String query = 'SELECT   ChangeDate__c  , ObjectId__c , Action__c,   ConcernedField__c , ConcernedUser__c  FROM AuditAccount__c '  ;
       if ( searchKey != null && searchKey != '' ) {
           String key = '%' + searchKey + '%'; 
           query += ' WHERE  Action__c LIKE :key';
       }
       if ( sortBy != null && sortDirection != null ) {
           query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
       }
       return Database.query( query );
}
@AuraEnabled(cacheable=true)
   public static List<AuditContract__c> getContract( String searchKey, String sortBy, String sortDirection) {
  
      
       String query = 'SELECT   ChangeDate__c  , ObjectId__c , Action__c,   ConcernedField__c , ConcernedUser__c  FROM AuditContract__c '  ;
       if ( searchKey != null && searchKey != '' ) {
           String key = '%' + searchKey + '%'; 
           query += ' WHERE  Action__c LIKE :key';
       }
       if ( sortBy != null && sortDirection != null ) {
           query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
       }
       return Database.query( query );
}
@AuraEnabled(cacheable=true)
   public static List<AuditLead__c> getLead( String searchKey, String sortBy, String sortDirection) {
  
      
       String query = 'SELECT   ChangeDate__c  , ObjectId__c , Action__c,   ConcernedField__c , ConcernedUser__c  FROM AuditLead__c '  ;
       if ( searchKey != null && searchKey != '' ) {
           String key = '%' + searchKey + '%'; 
           query += ' WHERE  Action__c LIKE :key';
       }
       if ( sortBy != null && sortDirection != null ) {
           query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
       }
       return Database.query( query );
}
@AuraEnabled(cacheable=true)
   public static List<AuditOpportunity__c> getopp( String searchKey, String sortBy, String sortDirection) {
  
      
       String query = 'SELECT   ChangeDate__c  , ObjectId__c , Action__c,   ConcernedField__c , ConcernedUser__c  FROM AuditOpportunity__c '  ;
       if ( searchKey != null && searchKey != '' ) {
           String key = '%' + searchKey + '%'; 
           query += ' WHERE  Action__c LIKE :key';
       }
       if ( sortBy != null && sortDirection != null ) {
           query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
       }
       return Database.query( query );
}
@AuraEnabled(cacheable=true)
   public static List<AuditProduct__c> getpro( String searchKey, String sortBy, String sortDirection) {
  
      
       String query = 'SELECT   ChangeDate__c  , ObjectId__c , Action__c,   ConcernedField__c , ConcernedUser__c  FROM AuditProduct__c '  ;
       if ( searchKey != null && searchKey != '' ) {
           String key = '%' + searchKey + '%'; 
           query += ' WHERE  Action__c LIKE :key';
       }
       if ( sortBy != null && sortDirection != null ) {
           query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
       }
       return Database.query( query );
}
@AuraEnabled(cacheable=true)
   public static List<AuditContact__c> getdeletedcon( Date searchkey, String sortBy, String sortDirection) {

      String a ='delete';
      
       String query = 'SELECT   ChangeDate__c  , ObjectId__c , Action__c,  ConcernedUser__c  FROM AuditContact__c where Action__c LIKE \'%'+ a +'%\'' ;
       
        // String b= '2022-04-18';
        if (searchkey!=null && searchkey<Date.today()) {
         query += ' and  ChangeDate__c=:searchkey';
        }
        System.debug(Date.today());
       if ( sortBy != null && sortDirection != null ) {
           query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
       }
       return Database.query( query );
}
@AuraEnabled(cacheable=true)
   public static List<AuditContract__c> getdeletedcontr( Date searchkey, String sortBy, String sortDirection) {

      String a ='delete';

       String query = 'SELECT   ChangeDate__c  , ObjectId__c , Action__c,  ConcernedUser__c  FROM AuditContract__c where Action__c LIKE \'%'+ a +'%\'' ;
       if (searchkey!=null && searchkey<Date.today()) {
        query += ' and  ChangeDate__c=:searchkey';
       
       }
       if ( sortBy != null && sortDirection != null ) {
           query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
       }
       return Database.query( query );
}
@AuraEnabled(cacheable=true)
   public static List<AuditLead__c> getdeletedlead( Date searchkey, String sortBy, String sortDirection) {

      String a ='delete';

       String query = 'SELECT   ChangeDate__c  , ObjectId__c , Action__c,  ConcernedUser__c  FROM AuditLead__c where Action__c LIKE \'%'+ a +'%\'' ;
       if (searchkey!=null && searchkey<Date.today()) {
        query += ' and  ChangeDate__c=:searchkey';  
       }
       if ( sortBy != null && sortDirection != null ) {
           query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
       }
       return Database.query( query );
}
@AuraEnabled(cacheable=true)
   public static List<AuditOpportunity__c> getdeletedopp( Date searchkey, String sortBy, String sortDirection) {

      String a ='delete';

       String query = 'SELECT   ChangeDate__c  , ObjectId__c , Action__c,  ConcernedUser__c  FROM AuditOpportunity__c where Action__c LIKE \'%'+ a +'%\'' ;
       if (searchkey!=null && searchkey<Date.today()) {
        query += ' and  ChangeDate__c=:searchkey';  
       }
       if ( sortBy != null && sortDirection != null ) {
           query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
       }
       return Database.query( query );
}
@AuraEnabled(cacheable=true)
   public static List<AuditAccount__c> getdeletedacc( Date searchkey, String sortBy, String sortDirection) {

      String a ='delete';

       String query = 'SELECT   ChangeDate__c  , ObjectId__c , Action__c,  ConcernedUser__c  FROM AuditAccount__c where Action__c LIKE \'%'+ a +'%\'' ;
       if (searchkey!=null && searchkey<Date.today()) {
        query += ' and  ChangeDate__c=:searchkey';  
       }
       if ( sortBy != null && sortDirection != null ) {
           query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
       }
       return Database.query( query );
}
@AuraEnabled(cacheable=true)
   public static List<AuditProduct__c> getdeletedpro( Date searchkey, String sortBy, String sortDirection) {

      String a ='delete';

       String query = 'SELECT   ChangeDate__c  , ObjectId__c , Action__c,  ConcernedUser__c  FROM AuditProduct__c where Action__c LIKE \'%'+ a +'%\'' ;
       if (searchkey!=null && searchkey<Date.today()) {
        query += ' and  ChangeDate__c=:searchkey';  
       }
       if ( sortBy != null && sortDirection != null ) {
           query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
       }
       return Database.query( query );
}

}

