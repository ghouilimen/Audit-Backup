import { LightningElement, wire, api, track} from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getopp from '@salesforce/apex/AuditActions.getopp';
import { NavigationMixin } from 'lightning/navigation';


//const actions = [ {  label: 'view', name: 'view'}];
const columns = [
    
    {
        label: 'Date',
        fieldName: 'ChangeDate__c',
        type: 'date',
        typeAttributes: {
        year: "numeric",
        month: "2-digit",
        day: "2-digit"
        },
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
        label: 'Field',
        fieldName: 'ConcernedField__c',
        sortable: true
    },
    {
        label: 'User',
        fieldName: 'ConcernedUser__c',
        sortable: true
    },
    {label: 'View Details',
    type: 'button',
    typeAttributes:  {  label: 'view', name: 'view'}}
   
    /*{
        label: 'Old Value',
        fieldName: 'OldValue__c ',    },
    {
        label: 'New Value',
        fieldName: 'NewValue__c ',
        type: 'text',
        sortable: true
    },*/
];

export default class Searchoppaudit  extends NavigationMixin(LightningElement) {
    @track value;
    @track error;
    @track data;
    @api sortedDirection = 'asc';
    @api sortedBy = 'ChangeDate__c';
    @api searchKey = '';
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

    handleclicks(event){
        const row = event.detail.row ;
        const actionName = event.detail.action.name;  
        this.recordId = row.Id;
        if ( actionName === 'view' ){
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: row.Id,
                   actionName: 'view'
                }
        });

  }
}

  
    @wire(getopp, {searchKey: '$searchKey', sortBy: '$sortedBy', sortDirection: '$sortedDirection'})
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
        this.searchKey = event.target.value;
        return refreshApex(this.result);
    }

}