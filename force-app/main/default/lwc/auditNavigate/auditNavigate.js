import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
export default class AuditNavigate extends NavigationMixin(LightningElement) {

    navigateToAuditContact(){
        this[NavigationMixin.Navigate]({
            type:"standard__webPage",
            attributes:{
                //objectApiName: 'AuditContact__c',
                //actionName: 'home'
                url: 'https://wise-wolf-n2hypj-dev-ed.lightning.force.com/lightning/n/Contact_audit_details'
               

            }
        })
    }
    navigateToAuditAccount(){
        this[NavigationMixin.Navigate]({
            type:'standard__webPage',
            attributes:{
                //objectApiName: 'AuditAccount__c',
                // actionName: 'home'
                url: "https://wise-wolf-n2hypj-dev-ed.lightning.force.com/lightning/n/Account_audit",
            }
        })
    }
    navigateToAuditOpportunity(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName: 'AuditOpportunity__c',
                actionName: 'home'
            }
        })
    }
    navigateToAuditProduct(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName: 'AuditProduct__c',
                actionName: 'home'
            }
        })
    }
    navigateToAuditContract(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName: 'AuditContract__c',
                actionName: 'home'
            }
        })
    }
    navigateToAuditLead(){
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName: 'AuditLead__c',
                actionName: 'home'
            }
        })
    }



}