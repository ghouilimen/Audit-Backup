import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
export default class AuditNav extends NavigationMixin(LightningElement) {

    navigateToAuditContact(){
        this[NavigationMixin.Navigate]({
            type:"standard__navItemPage",
            attributes:{
                apiName: 'contact_audit_details',
                //actionName: 'home'
                //url: 'https://wise-wolf-n2hypj-dev-ed.lightning.force.com/lightning/n/Contact_audit_details'
               
              
            }
        })
    }
    navigateToAuditAccount(){
        this[NavigationMixin.Navigate]({
            type:'standard__navItemPage',
            attributes:{
               apiName: 'Account_audit',
                
            }
        })
    }
    navigateToAuditOpportunity(){
        this[NavigationMixin.Navigate]({
            type:'standard__navItemPage',
            attributes:{
                //url:"https://wise-wolf-n2hypj-dev-ed.lightning.force.com/lightning/n/Opportunity_audit_details"
                apiName: 'Opportunity_audit_details',
            }
        })
    }
    navigateToAuditProduct(){
        this[NavigationMixin.Navigate]({
            type:'standard__navItemPage',
            attributes:{
               //url:"https://wise-wolf-n2hypj-dev-ed.lightning.force.com/lightning/n/Porduct_audit_details"
               apiName: 'Porduct_audit_details',
            }
        })
    }
    navigateToAuditContract(){
        this[NavigationMixin.Navigate]({
            type:'standard__navItemPage',
            attributes:{
              // url:"https://wise-wolf-n2hypj-dev-ed.lightning.force.com/lightning/n/Contract_audit_details"
              apiName: 'Contract_audit_details' ,
            }
        })
    }
    navigateToAuditLead(){
        this[NavigationMixin.Navigate]({
            type:'standard__navItemPage',
            attributes:{
              // url:"https://wise-wolf-n2hypj-dev-ed.lightning.force.com/lightning/n/Lead_audit_details"
              apiName: 'Lead_audit_details' ,
            }
        })
    }



}