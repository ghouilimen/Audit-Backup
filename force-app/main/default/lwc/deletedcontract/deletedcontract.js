import { LightningElement, wire, api, track} from 'lwc';
import { refreshApex } from '@salesforce/apex';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import BackupContract from '@salesforce/apex/BackupHelper.BackupContract';
import getdeletedcontr from '@salesforce/apex/AuditActions.getdeletedcontr';
import getupdatecontract from '@salesforce/apex/AuditActions.getupdatecontract';
import RollBackUpdateContract from '@salesforce/apex/BackupHelper.RollBackUpdateContract';


const columns = [
    
    {
        label: 'Date',
        fieldName: 'ChangeDate__c',
        type: 'text',
        
        sortable: true
    },
    {
        label: 'Object',
        fieldName: 'ObjectId__c',
        type: 'text',

    },
   
    {
        label: 'Action ',
        fieldName: 'Action__c',
        sortable: true
    },
    
    {
        label: 'User',
        fieldName: 'ConcernedUser__c',
        sortable: true
    },
    {
        type: "button",initialWidth: 100,
        typeAttributes: {
            label: 'Backup',
            title: 'Backup',
            name: 'Backup',
            value: 'Backup',
            class: 'scaled-down',
         
        }}];
        const columns1 = [
    
            {
                label: 'Date',
                fieldName: 'ChangeDate__c',
                type: 'text',
                
                sortable: true
            },
            {
                label: 'Object',
                fieldName: 'ObjectId__c',
                type: 'text',
        
            },
             
            {
                label: 'User',
                fieldName: 'ConcernedUser__c',
                sortable: true
            },
            {
                label: 'Field',
                fieldName: 'ConcernedField__c',
                sortable: true
            },
             {
                    label: 'Old Value',
                    fieldName: 'OldValue__c',  
                    type: 'text'  },
            {
                    label: 'New Value',
                    fieldName: 'NewValue__c',
                    type: 'text'
                   
                },
            {
                type: "button",initialWidth: 100,
                typeAttributes: {
                    label: 'RollBack',
                    title: 'Rollback',
                    name: 'RollBack',
                    value: 'RollBack',
                    class: 'scaled-down',
                 
                }},
           ];
   


export default class Deletedproduct extends NavigationMixin(LightningElement)  {
    @track value;
    @track error;
    @track data;
    @track data1;
    @api sortedDirection = 'asc';
    @api sortedBy = 'ChangeDate__c';
    @api searchkey = null  ;
    result;
    @track value1;
    @track error1;
    @track data1;
    result1;
    
    @track page = 1; 
    @track page1 = 1; 
    @track items = []; 
    @track items1 = []; 
    @track data = []; 
    @track data1 = []; 
    @track columns; 
    @track columns1;
    @track startingRecord = 1;
    @track startingRecord1 = 1;
    @track endingRecord = 0; 
    @track endingRecord1 = 0; 
    @track pageSize = 5; 
    @track pageSize1 = 5; 
    @track totalRecountCount = 0;
    @track totalRecountCount1 = 0;
    @track totalPage = 0;
    @track totalPage1 = 0;

    loading;
    @track isModalOpen = false;
    @track isModalOpen1 = false;

    openModal() {
        // to open modal set isModalOpen tarck value as true
        this.isModalOpen = true;
    }
    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpen = false;
    }
    openModal1() {
        // to open modal set isModalOpen tarck value as true
        this.isModalOpen1 = true;
    }
    closeModal1() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpen1 = false;
    }
    

    handleclicks(event){
        const row = event.detail.row;
        BackupContract({ sObj: row }).then(result => {
          this.loading = true;
          this.stopLoading(800);
        }).then(result => {
          const evt = new ShowToastEvent({
            title: 'Success',
            message: 'Your object has been recovered',
            variant: 'info',
        });
        this.dispatchEvent(evt);
      })
        .catch (error => {
            this.error = error;
        });
      }
      handleclickss(event){
        const row = event.detail.row;
        RollBackUpdateContract({ sObj: row }).then(result => {
          this.loading = true;
          this.stopLoading(800);
        }).then(result => {
          const evt = new ShowToastEvent({
            title: 'Success',
            message: 'Your field has been recovered',
            variant: 'info',
        });
        this.dispatchEvent(evt);
      })
        .catch (error => {
            this.error1 = error;
        });
      }
     stopLoading(timeoutValue) {
                setTimeout(() => {
                  refreshApex(this.wiredDataResult);
                  refreshApex(this.wiredDataResultt);
                  refreshApex(this.wiredDataResulttt);
                  this.loading = false;
                }, timeoutValue);
              }

    
  
    @wire(getdeletedcontr, {  searchkey: '$searchkey', sortBy: '$sortedBy', sortDirection: '$sortedDirection'})
    wiredAccounts({ error, data }) {
        if (data) {
            console.log(data)

            this.items = data;
            console.log(this.items)
            this.totalRecountCount = data.length; 
            this.totalPage = Math.ceil(this.totalRecountCount / this.pageSize); 
            
            this.data = this.items.slice(0,this.pageSize); 
            this.endingRecord = this.pageSize;
            this.columns = columns;

            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.data = undefined;
        }
    }
    @wire(getupdatecontract, {  searchkey: '$searchkey', sortBy: '$sortedBy', sortDirection: '$sortedDirection'})
    getupdatecontract({ error, data }) {
        if (data) {
            console.log(data)

            this.items1 = data;
            this.totalRecountCount1 = data.length; 
            this.totalPage1 = Math.ceil(this.totalRecountCount1 / this.pageSize1); 
            
            this.data1 = this.items1.slice(0,this.pageSize1); 
            this.endingRecord1 = this.pageSize1;
            this.columns1 = columns1;

            this.error1 = undefined;
        } else if (error) {
            this.error1 = error;
            this.data1 = undefined;
        }
    }

    //clicking on previous button this method will be called
    previousHandler() {
        if (this.page > 1) {
            this.page = this.page - 1; //decrease page by 1
            this.displayRecordPerPage(this.page);
        }
    }
    previousHandler1() {
        if (this.page1 > 1) {
            this.page1 = this.page1 - 1; //decrease page by 1
            this.displayRecordPerPage(this.page1);
        }
    }

    //clicking on next button this method will be called
    nextHandler() {
        if((this.page<this.totalPage) && this.page !== this.totalPage){
            this.page = this.page + 1; //increase page by 1
            this.displayRecordPerPage(this.page);            
        }             
    }
    nextHandler1() {
        if((this.page1<this.totalPage1) && this.page1 !== this.totalPage1){
            this.page1 = this.page1 + 1; //increase page by 1
            this.displayRecordPerPage1(this.page1);            
        }             
    }

    //this method displays records page by page
    displayRecordPerPage(page){

        this.startingRecord = ((page -1) * this.pageSize) ;
        this.endingRecord = (this.pageSize * page);

        this.endingRecord = (this.endingRecord > this.totalRecountCount) 
                            ? this.totalRecountCount : this.endingRecord; 

        this.data = this.items.slice(this.startingRecord, this.endingRecord);

        this.startingRecord = this.startingRecord + 1;
    }    
    displayRecordPerPage1(page){

        this.startingRecord1 = ((page -1) * this.pageSize1) ;
        this.endingRecord1 = (this.pageSize1 * page);

        this.endingRecord1 = (this.endingRecord1 > this.totalRecountCount1) 
                            ? this.totalRecountCount1 : this.endingRecord1; 

        this.data1 = this.items1.slice(this.startingRecord1, this.endingRecord1);

        this.startingRecord1 = this.startingRecord1 + 1;
    }   
    
    sortColumns( event ) {
        this.sortedBy = event.detail.fieldName;
        this.sortedDirection = event.detail.sortDirection;
        return refreshApex(this.result);
        
    }
    sortColumns1( event ) {
        this.sortedBy = event.detail.fieldName;
        this.sortedDirection = event.detail.sortDirection;
        return refreshApex(this.result1);
        
    }
  
    handleKeyChange( event ) {
        this.searchkey = event.target.value;
        return refreshApex(this.result);
    }
    handleKeyChange1( event ) {
        this.searchkey = event.target.value1;
        return refreshApex(this.result1);
    }

}