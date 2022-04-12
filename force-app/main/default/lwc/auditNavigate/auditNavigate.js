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
            type:'standard__webPage',
            attributes:{
                url:"https://wise-wolf-n2hypj-dev-ed.lightning.force.com/lightning/n/Opportunity_audit_details"
            }
        })
    }
    navigateToAuditProduct(){
        this[NavigationMixin.Navigate]({
            type:'standard__webPage',
            attributes:{
               url:"https://wise-wolf-n2hypj-dev-ed.lightning.force.com/lightning/n/Porduct_audit_details"
            }
        })
    }
    navigateToAuditContract(){
        this[NavigationMixin.Navigate]({
            type:'standard__webPage',
            attributes:{
               url:"https://wise-wolf-n2hypj-dev-ed.lightning.force.com/lightning/n/Contract_audit_details"
            }
        })
    }
    navigateToAuditLead(){
        this[NavigationMixin.Navigate]({
            type:'standard__webPage',
            attributes:{
               url:"https://wise-wolf-n2hypj-dev-ed.lightning.force.com/lightning/n/Lead_audit_details"
            }
        })
    }



}