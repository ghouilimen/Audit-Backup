import { LightningElement, wire, api, track} from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getdeletedlead from '@salesforce/apex/AuditActions.getdeletedlead';
import BackupLead from '@salesforce/apex/BackupHelper.BackupLead';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


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
   


export default class Deletedlead extends NavigationMixin(LightningElement)  {
    @track value;
    @track error;
    @track data;
    @api sortedDirection = 'asc';
    @api sortedBy = 'ChangeDate__c';
    @api searchkey = null  ;
    result;
    
    @track page = 1; 
    @track items = []; 
    @track data = []; 
    @track columns; 
    @track startingRecord = 1;
    @track endingRecord = 0; 
    @track pageSize = 5; 
    @track totalRecountCount = 0;
    @track totalPage = 0;
    loading;
    @track isModalOpen = false;
    openModal() {
        // to open modal set isModalOpen tarck value as true
        this.isModalOpen = true;
    }
    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpen = false;
    }
    

    handleclicks(event){
        const row = event.detail.row;
        BackupLead({ sObj: row }).then(result => {
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
     stopLoading(timeoutValue) {
                setTimeout(() => {
                  refreshApex(this.wiredDataResult);
                  refreshApex(this.wiredDataResultt);
                  refreshApex(this.wiredDataResulttt);
                  this.loading = false;
                }, timeoutValue);
              }

    
  
    @wire(getdeletedlead, { searchkey: '$searchkey', sortBy: '$sortedBy', sortDirection: '$sortedDirection'})
    wiredAccounts({ error, data }) {
        if (data) {
            console.log(data)

            this.items = data;
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

    //clicking on previous button this method will be called
    previousHandler() {
        if (this.page > 1) {
            this.page = this.page - 1; //decrease page by 1
            this.displayRecordPerPage(this.page);
        }
    }

    //clicking on next button this method will be called
    nextHandler() {
        if((this.page<this.totalPage) && this.page !== this.totalPage){
            this.page = this.page + 1; //increase page by 1
            this.displayRecordPerPage(this.page);            
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
    
    sortColumns( event ) {
        this.sortedBy = event.detail.fieldName;
        this.sortedDirection = event.detail.sortDirection;
        return refreshApex(this.result);
        
    }
  
    handleKeyChange( event ) {
        this.searchkey = event.target.value;
        return refreshApex(this.result);
    }

}