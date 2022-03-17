import { LightningElement } from 'lwc';
import findAuditsByUsers from '@salesforce/apex/AuditActions.findAuditsByUsers';

const columns = [
    {
        label: 'Concerned_User',
        fieldName: 'Concerned_User__c'
    }, {
        label: 'Object',
        fieldName: 'Object',
        type: 'text'
    }, {
        label: 'Date ',
        fieldName: 'Date',
        type: 'date',
    }, {
        label: 'Action',
        fieldName: 'Action',
        type: 'text'
    } , {
        label: 'Old Value',
        fieldName: 'Old Value',
        type: 'text'
    }, {
        label: 'New Value',
        fieldName: 'New Value',
        type: 'text'
    },
];

export default class SearchAudit extends LightningElement {

    searchData;
    columns = columns;
    errorMsg = '';
    strSearchAccName = '';
    

    handleAccountName(event) {
        this.errorMsg = '';
        this.strSearchAccName = event.currentTarget.value;
    }

    handleSearch() {
        if(!this.strSearchAccName) {
            this.errorMsg = 'Please enter Object name to search audits.';
            this.searchData = undefined;
            return;
        }

        findAuditsByUsers({strAccName : this.strSearchAccName})
        .then(result => {
            this.searchData = result;
        })
        .catch(error => {
            this.searchData = undefined;
            if(error) {
                if (Array.isArray(error.body)) {
                    this.errorMsg = error.body.map(e => e.message).join(', ');
                } else if (typeof error.body.message === 'string') {
                    this.errorMsg = error.body.message;
                }
            }
        }) 
    }
}